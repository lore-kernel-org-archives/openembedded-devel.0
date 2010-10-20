Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P8ZJW-0007nv-S9
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 16:06:48 +0200
Received: by bwz9 with SMTP id 9so2491902bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=/332hrIaB+aA16S+W9OEgkKsxdGxCcXYgFEfrCszJ3w=;
	b=DF/44RW6PDEFg3/VuiisrB79NbQ9mRl1aaLFV351NAwoh06eiMA5y27KonMDfCLO7F
	vhwbHMQ+SWCcGgp/ykS/JshTjgIHSGt7g9YzznhJIHnYnu/rc3ELoPgMuG5j7wv+NcMU
	xK7dO5j1eXwjh4Tydyn04fdRFfG3TwyXRXbEQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=fC24iEEngbpkYmX1CpSIFIlT5Tyf7pCDGiioOjU+g2Wp+MFAt0eBZU+OdW2lypjBE1
	rh1dHSYi/Di2Y5Ns53lEpsyS7CGnr5TfBSUYxcUTw9dh0U7MjNMqErhlcA3mFphTzOx7
	+yLKj4+Xdf1GrPoNMEos74XDdhqebajWVkiLo=
Received: by 10.204.25.207 with SMTP id a15mr6931924bkc.83.1287583562137;
	Wed, 20 Oct 2010 07:06:02 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y19sm194035bkw.18.2010.10.20.07.06.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Oct 2010 07:06:00 -0700 (PDT)
Date: Wed, 20 Oct 2010 16:05:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101020140543.GN3324@jama>
References: <4CBEB7E8.5020109@nedap.com>
	<AANLkTikBiKGuQYXCdi_QMirA7_AjQn9b0A0CWtmkMu90@mail.gmail.com>
	<29F88E4E-18CC-4CD2-8A76-5C78ED4EDAC7@nikom.net>
MIME-Version: 1.0
In-Reply-To: <29F88E4E-18CC-4CD2-8A76-5C78ED4EDAC7@nikom.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building gcc-cross-initial for armv5te
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
X-List-Received-Date: Wed, 20 Oct 2010 14:06:48 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 20, 2010 at 09:26:32AM -0400, Nik wrote:
> What os are you compiling on?  Can you run the cross compile gcc from the command line and get the no input files message?

Related log from #oe - as I'm lazy to type it again :)

12:39:53 < morphis> anybody looked already on "failure building gcc-cross-initial" thing?
12:41:13 < JaMa|W> morphis: cleaning and rebuilding whole toolchain usually helps in those cases
12:41:23 < morphis> already did that
12:41:40 < JaMa|W> cleaned all gcc/binutils/eglibc?
12:41:48 < morphis> rm -rf tmp
12:42:06 < morphis> somebody on the ML has the same problem
12:42:34 < JaMa|W> I had the same, but rebuild did work for me
12:42:55 < morphis> see http://tinderbox.openembedded.org/public/logs/task/8947680.txt
12:42:56 < morphis> hm
12:43:04 < morphis> I started a second rebuild
12:43:09 < morphis> maybe it works now
12:44:09 < JaMa|W> morphis: config.log is more important
12:44:39 < morphis> conftest.c:11: fatal error: ac_nonexistent.h: No such file or director
12:44:58 < JaMa|W> but ie shr buildhost also built gcc-cross for 2 archs in last 3 days too
12:45:10 < morphis> hm
12:46:01 -!- etrunko_ [~edulima@201.53.212.47] has quit [Ping timeout: 240 seconds]
12:48:02 < JaMa|W> morphis: that's imho not real error, just what "checking how to run the C preprocessor" expects to see
12:48:16 < morphis> ok
12:48:25 < morphis> will wait until the build fails and then look again
13:26:50 < eFfeM_work> morphis: perhaps try a clean build (no pstage or tmp); i could build slugos for nslu2 (le and be) without problem (branch testing-next)
13:30:44 < morphis> eFfeM_work: already tried that
13:30:47 < morphis> two times
13:30:50 < morphis> did not wokred
13:30:55 < morphis> s/wokred/worked/
13:30:59 < eFfeM_work> ah ok, what machine/distro ?
13:31:11 < eFfeM_work> i tried slugos, but that is on an older gcc i think
13:31:41 < eFfeM_work> and I did minimal/console-image for sheevaplug (which is armv5te)
13:34:45 < morphis> palmpre/shr
13:38:08 < eFfeM_work> do minimal and shr use a different gcc version or rev ?
13:38:14 < eFfeM_work> has the recipe been changed since ?
13:38:26 < eFfeM_work> that are the things you want to look at
13:39:25 < morphis> some infos from config.log: http://pastie.org/1235203
13:39:37 < morphis> recipe did not changed
13:39:47 < morphis> shr choose new gcc version some days ago I think
13:40:04 < morphis> ah damn it
13:40:08 < morphis> I forgot some lines
13:41:37 < morphis> it tells me /home/morphis/oe/palmpre/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.x86_64-linux.arm-oe-linux-gnueabi/./gcc/as: line 83: exec: : not found
13:42:58 < JaMa|W> morphis: yup that's what I had
13:43:25 < morphis> JaMa|W: hm ok
13:43:35 < morphis> should I try to rebuild a second time?
13:43:45 < morphis> äh a third time
13:44:06 < JaMa|W> pastebin /home/morphis/oe/palmpre/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.x86_64-linux.arm-oe-linux-gnueabi/./gcc/as
13:45:04 < morphis> morphis@nirvana ...gcc-cross-initial-4.5-r12.0+svnr164562 % ls /home/morphis/oe/palmpre/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.x86_64-linux.arm-oe-linux-gnueabi/./gcc/as
13:45:04 < morphis> /home/morphis/oe/palmpre/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.x86_64-linux.arm-oe-linux-gnueabi/./gcc/as*
13:45:12 < morphis> it's there
13:46:14 < JaMa|W> and what's on line 83? it want's to exec ${empty var} IIRC
13:49:24 < morphis> mom
13:50:25 < CIA-9> Martin Jansa <Martin.Jansa@gmail.com> master * r85f8336c9b openembedded.git/recipes/libxml/libxml2.inc: (log message trimmed)
13:50:25 < CIA-9> libxml2: enable debug module (default is on)
13:50:25 < CIA-9> * it's not runtime debug (--with-run-debug or --with-mem-debug)
13:50:25 < CIA-9> * it's needed by python API (which is not limited to provide bindings
13:50:25 < CIA-9> based on enabled modules so ie python call param_node.lsCountNode()
13:50:25 < CIA-9> always calls libxml2mod.xmlLsCountNode(self._o), but this function is
13:50:26 < CIA-9> available only with debug module enabled.
13:55:54 -!- arun_ [~arun@unaffiliated/sindian] has quit [Ping timeout: 252 seconds]
13:58:54 < morphis> JaMa|W: http://pastie.org/1235220
14:03:08 < JaMa|W> ORIGINAL_AS_FOR_TARGET="" is that empty var :/
14:04:04 < JaMa|W> morphis: maybe it's related to  http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=f1148d26740e57cba4fe29fd78c234359868a50e
14:04:17 < JaMa|W> morphis: I haven't build from scratch after this commit
14:05:58 < JaMa|W> but that's included only in target binutils (as commit says) so it shouldn't be related
14:06:37 < morphis> hm, will remove this line and try again
14:07:19 < JaMa|W> rather check how ORIGINAL_AS_FOR_TARGET is decided
14:08:28 -!- dth_ntb [~dth@a89-182-18-237.net-htp.de] has quit [Ping timeout: 276 seconds]
14:08:46 < morphis> jepp
14:11:10 < JaMa|W> hmm first I have seen it 20 days ago..
14:11:12 < JaMa|W> ./openmoko-cdevel/openmoko-cdevel-2010-10-01:13:13 < JaMa> /home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/gcc-cross-initial-4.5-r10.0+svnr164562/gcc-4.5/build.x86_64-linux.arm-oe-linux-gnueabi/./gcc/as: line
                   83: exec: : not found
14:13:46 < morphis> will try again at home ...
14:13:53 < morphis> cya

> Sent from my iPhone

Sent from my mutt

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


