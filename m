Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LeIJX-00061E-SU
	for openembedded-devel@openembedded.org; Tue, 03 Mar 2009 01:16:51 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LeIFe-0000v4-Sl
	for openembedded-devel@openembedded.org; Tue, 03 Mar 2009 00:12:50 +0000
Received: from p5483a6c4.dip0.t-ipconnect.de ([84.131.166.196])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 03 Mar 2009 00:12:50 +0000
Received: from vjensen by p5483a6c4.dip0.t-ipconnect.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 03 Mar 2009 00:12:50 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Vitus Jensen <vjensen@gmx.de>
Date: Tue, 3 Mar 2009 00:12:38 +0000 (UTC)
Message-ID: <gohslm$3bl$1@ger.gmane.org>
References: <49AB58CA.7090406@tait.co.nz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5483a6c4.dip0.t-ipconnect.de
User-Agent: Pan/0.133 (House of Butterflies)
Sender: news <news@ger.gmane.org>
Subject: Re: fatal: Not a git repository
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
X-List-Received-Date: Tue, 03 Mar 2009 00:16:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am Mon, 02 Mar 2009 16:55:54 +1300 schrieb Douglas Royds:

> Anyone else getting this?
> 
>     NOTE: Handling BitBake files: / (6587/6587) [100 %] NOTE: Parsing
>     finished. 6302 cached, 0 parsed, 285 skipped, 0 masked. NOTE: Cache
>     is clean, not saving.
>     NOTE: build 200903021645: started
>     fatal: Not a git repository <----------------------
> 
>     OE Build Configuration:
>     BB_VERSION        = "1.8.12"
>     ...


Yes, it happens on every build.  I guess bitbake is testing the current 
directory via git and would include the current head in the build number.

> The same complaint seems to crop up at various points during a build, as
> well.
> 
> Suggestions?

Just ignore.  Besides called "fatal" it isn't fatal at all.

Bye,
 Vitus



