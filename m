Received: from mail-yx0-f198.google.com ([209.85.210.198])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NpO8R-000527-Ps
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 16:47:55 +0100
Received: by yxe36 with SMTP id 36so1505944yxe.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 07:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ZyrP64gzVVcQ90uMe7GfTNhyuEy1PuBYfK2hFmdw4NY=;
	b=lx8wjlr6VJedaUdcuNf1IaLf7M4YDd9KSdWxe+/E1cH6M+geugd5ODuEJ8VQklad+n
	Wc0kxoRKCMKtODzF23Mcao3YICU1JZnTRFXivUsJaQeKvgFE1mJZtGBiB873eghiTKMn
	qWCO7zoJ5KYbTBhNKu6e4qF7MW1eP7GKhXHA8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qx9C4lQ+62CFUfT3YB6vkVXuyPnouYDssvjJ7pyEAzacCVeNWmSnc0u+4V0lUBm6zE
	dolktkWM49mvdpKqYuUSoUEedEL5s7TiKbsGF8fPzu8C2kGILboxQaO25VHq/bk9mleY
	VxaDIZge/s9i7fjS0DL15vj/L11XZeylXTEZU=
MIME-Version: 1.0
Received: by 10.101.152.5 with SMTP id e5mr2921846ano.5.1268235888908; Wed, 10 
	Mar 2010 07:44:48 -0800 (PST)
In-Reply-To: <ac9c93b11002282328l61356cc1y188b47d0f974369e@mail.gmail.com>
References: <ac9c93b11002281201j44a861e1saa803be9f338ee10@mail.gmail.com>
	<20100228221056.GG30145@xora-desktop.xora.org.uk>
	<ac9c93b11002282328l61356cc1y188b47d0f974369e@mail.gmail.com>
Date: Wed, 10 Mar 2010 16:44:48 +0100
Message-ID: <ac9c93b11003100744g5eee3250me7f0b668e8727060@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.198
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] duplicate recipes
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
X-List-Received-Date: Wed, 10 Mar 2010 15:47:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Time for a summary I guess:

original proposal from me:
Probably the best scenario is to remove all versions which
- are not the latest version
- are not  pinned with  PREFERRED_VERSION  in conf/distro/*
- do not have the largest DEFAULT_PREFERENCE

opinions:
Koen: see glib proposal
Mickey: move out of sight or own repo would have my support
Philip: no as we do not know who is using the older versions
Graeme: expressed that there are more important tasks to be done

and in the glib-2.0 cleanup thread:
koen: suggests to clean up after improving the recipes and prefers to
move recipe to obsolete instead of delete it
mickey: move out of sight
graham: comes with more offending case, no opinion on the proposal given
Marcin (on the gcc stuff: "If someone wants one then we have SCM for it."
[note from FM: not sure if this a specific remark on the gcc debian
patches or a generic statement]
khem: moving to recipes/obsolete may not be so bad
Denys: +1 (we already have recipes/obsolete in BBMASK, reduces parse
time, git-mv does preserve history)

and in the recipes/${distro} thread there were also a few comments on this.
Most of these are from the same persons as mentioned above. Only
addition that is related to this thread is:
otavio: in favour of removing (faster parsing)

Seems most people are in favour of remving out of sight:

Counting head's for that variant (assuming that people wo stated that
removal is the best choice are not against moving to an obsolete dir).
in favour: frans, mickey, khem, denys, otavio and perhaps marcin
against: koen, philip
I've ocunted graeme as neutral and graham as no opinion given.

If you feel I misrepresented your position or if I missed your
position, feel free to follow up.

Best regards, frans

(ps: i expect that this concerns some 2000 recipes (out of 8000))


