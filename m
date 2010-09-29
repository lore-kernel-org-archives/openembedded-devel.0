Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P0qRT-00044E-KH
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 08:47:05 +0200
Received: by iwn2 with SMTP id 2so657713iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 23:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=guldkqUj7PuPetVHVCGgpnZ6kE7sIo6Z86GqPPDB4yg=;
	b=D1QcPIAEWe6qujCZNm3G0YiFljp/G5Xy2u0fnoNGqxsYwi1PSgVDOOEZM5tSi++Vt0
	o9cbjDi7lfK7ojAEETDpv3v/cK70uSJwAHnlClyJNDmg39lj1W1E87PAROhNWw0LKQJt
	L/QrQoCLIigABu2py1leNgMANj8X1gRuNzJSg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GgnjUytdz8uZAOO20Jpcv5o6ecmRFJBU7OOmXDAbucHV8UtJlVcf+wIm1PtvE+FlFs
	/dGovC8R3z1iIaNDjD02hJQzxdMU8l4ELMgoOMm0vtV2fMht1G/dDo8BFjeZbjptALyh
	9Dbztl601K81jSpKuMjukwogklik6uwfQyZ8E=
MIME-Version: 1.0
Received: by 10.231.171.18 with SMTP id f18mr1316532ibz.9.1285742810125; Tue,
	28 Sep 2010 23:46:50 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 28 Sep 2010 23:46:50 -0700 (PDT)
In-Reply-To: <4CA2DDFF.2090201@eukrea.com>
References: <AANLkTinMWT7K-h+hH0LvPD119Nxxpitro=f6igQvL7-K@mail.gmail.com>
	<4CA2DDFF.2090201@eukrea.com>
Date: Wed, 29 Sep 2010 08:46:50 +0200
Message-ID: <AANLkTikv8x4xoAD5zPnprHpo9wcWc1hi8FF=5m8mtCi4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] kernel NOTE messages fix
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
X-List-Received-Date: Wed, 29 Sep 2010 06:47:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks for the feedback and the acks.
I'll make a formal patch for this and push it with the acks added.
Maybe this evening otherwise tomorrow (but if someone can't wait so
long feel free to make the patch (but please let me know on irc, so we
do not end up duplicating things))

Wrt the kernel-dev route: I didn't try it, as Henning & Petr (and
maybe also Eric) tried this before.

Tom, I do encounter issues with scripts and strip either. They are
still on my to-investigate list and are not related to the issue at
hand, but when building slugos-image for nslu2 I get the messages
given below. Guess this is the same problem you are facing.

I'm open for hints on how to fix this one.

Frans.

ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/bin2c''
strip command failed
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/kconfig/conf''
strip command failed
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/basic/fixdep''
strip commarmeb-linux-gnueabi-strip: Unable to recognise the format of
the input file `/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/genksyms/genksyms'
armeb-linux-gnueabi-objcopy: Unable to recognise the format of the
input file `/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/genksyms/genksyms'
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/bin2c''
strip command failed
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/kconfig/conf''
strip command failed
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/basic/fixdep''
strip command failed
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/basic/docproc''
strip command failed
ERROR:armeb-linux-gnueabi-objcopy: Unable to recognise the format of
the input file `/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/mod/mk_elfconfig'
armeb-linux-gnueabi-strip: Unable to recognise the format of the input
file `/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/mod/mk_elfconfig'
armeb-linux-gnueabi-objcopy: Unable to recognise the format of the
input file `/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/mod/mk_elfconfig'
armeb-linux-gnueabi-objcopy: Unable to recognise the format of the
input file `/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/mod/modpost'
armeb-linux-gnueabi-strip: Unable to recognise the format of the input
file `/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/mod/modpost'
armeb-linux-gnueabi-objcopy: Unable to recognise the format of the
input file `/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/mod/modpost'
and failed
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/basic/docproc''
strip command failed
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/genksyms/genksyms''
strip command failed
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/mod/mk_elfconfig''
strip command failed
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_TEST/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/mod/modpost''
strip command failed


