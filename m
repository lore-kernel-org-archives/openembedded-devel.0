Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L4mqp-00024V-9j
	for openembedded-devel@openembedded.org; Tue, 25 Nov 2008 02:36:27 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L4mo1-0000nx-F2
	for openembedded-devel@openembedded.org; Tue, 25 Nov 2008 01:33:34 +0000
Received: from 203.117.215.163 ([203.117.215.163])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 25 Nov 2008 01:33:33 +0000
Received: from robk by 203.117.215.163 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 25 Nov 2008 01:33:33 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Tue, 25 Nov 2008 09:35:43 +0800
Message-ID: <ggfkl5$bup$1@ger.gmane.org>
References: <ggd81q$re5$1@ger.gmane.org> <492A3368.4070302@dls.net>
	<ggdhia$cv4$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 203.117.215.163
User-Agent: KNode/0.10.9
Sender: news <news@ger.gmane.org>
Subject: Re: Bitbake r1090 (env hiding) makes my build fail.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Nov 2008 01:36:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

[Re-posted with lines trimmed, sorry if this arrives twice]

Koen Kooi wrote:
> Why not put
> 
> CCACHE=""
> 
> in local.conf?

I just commented out the CCACHE line in bitbake.conf for testing. The result
then is a bit more interesting:

| + do_compile
| +
gcc -isystem/bulk/opt/oe/stable/build-ble-i586/tmp/staging/\
x86_64-linux/include  -O2 -isystem/bulk/opt/oe/stable/build\
-ble-i586/tmp/staging/x86_64-linux/include -o
oe_sha256sum main.c sha256.c
| gcc: error trying to exec 'cc1': execvp: No such file or directory
| gcc: error trying to exec 'cc1': execvp: No such file or directory
NOTE: Task
failed: /bulk/opt/oe/stable/build-ble-i586/tmp/work/\
shasum-native-1.0-r1/temp/log.do_compile.32323

I.e. gcc can't find its backend (which should be
at /usr/lib64/gcc/x86_64-suse-linux/4.3/cc1 on my machine). I can't see in
r1090 what could cause that. "export BB_PRESERVE_ENV=1" doesn't help.

> PS: Is that on a RH (derived) buildhost?

OpenSuse 11, x86_64, building i586..

Cheers!

    Rob



