Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NkI2f-0004JD-HM
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 15:16:48 +0100
Received: by iwn9 with SMTP id 9so4370360iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2010 06:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=A0S2s9kZHerztiPBqZsuEmWzU3g99hI3xOnNcPXiVTw=;
	b=b65OHh/lbPG540Q9Bu5HxI7j0BlkWzzuby+cFuuN40hzH3TWZwpmQMSzOdb0csMbDm
	iHNYj2TQvEIJLhpBJ777iGhSUrXtNgX0L7KEvJW/Ae/JYiTevK3X05cuSY7ZNQxVw3yJ
	CAAyg96k1HY/Uxwy50yZQtvSPMEyyO2VCngLw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=IDX4z6niwSiScq2k7I82kxBIGVZQv+AS3JYshmBHjrKvgl2GuXx/lWsXc/J+vCmrYk
	oKwccGZ4ZpDTJpF/rUxJlvXJORFj2J6UHcjeMGPT6hisEXWaWaSaP/JEL99UcFogyf0u
	Fas/7UQR0TdUBm/F65qfjBIX62sUArfcdtPK8=
MIME-Version: 1.0
Received: by 10.231.146.79 with SMTP id g15mr74718ibv.49.1267020838761; Wed, 
	24 Feb 2010 06:13:58 -0800 (PST)
In-Reply-To: <19c1b8a91002231910y3b44f0ecuc8992499c1a4086@mail.gmail.com>
References: <f96d234e1002230827y25028493l7f25ab05b6fbac76@mail.gmail.com>
	<19c1b8a91002231036u46b1b35andf9fb71345805669@mail.gmail.com>
	<f96d234e1002231243h1e75af62g90d490aa792fbe96@mail.gmail.com>
	<19c1b8a91002231910y3b44f0ecuc8992499c1a4086@mail.gmail.com>
Date: Wed, 24 Feb 2010 09:13:58 -0500
Message-ID: <f96d234e1002240613i75bfab0byfcabe9aa6737dc6a@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: gettext native failure
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
X-List-Received-Date: Wed, 24 Feb 2010 14:16:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 23, 2010 at 10:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> I see. gettext requires libxml2 at buildtime therefore adding
> libxml2-native to DEPENDS
> should solve this. libxml2-native should not depend on gettext-native
> if it does then its a bug.
>
> Dependency chain which pulls in gettext-native is
>
> insane.bbclass -> desktop-file-utils-native -> glib-2.0-native -> gettext-native
>
> so my guess is that it has not yet built libxml2-native when it starts
> to build gettext-native and defaults to whatever is on the build
> system due to parallel'ness of bitbake

Thanks.  I had a mental block thinking linxml2-native depended on
gettext, but it was the parallel build that was getting it build
first.  The following patch fixes it:

diff --git a/recipes/gettext/gettext_0.17.bb b/recipes/gettext/gettext_0.17.bb
index 2f7faa7..fbb479a 100644
--- a/recipes/gettext/gettext_0.17.bb
+++ b/recipes/gettext/gettext_0.17.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv3"
 PR = "r5"
 DEPENDS = "gettext-native virtual/libiconv ncurses expat"
-DEPENDS_virtclass-native = ""
+DEPENDS_virtclass-native = "libxml2-native"
 PROVIDES = "virtual/libintl"
 PROVIDES_virtclass-native = ""
 RCONFLICTS_gettext-libintl = "proxy-libintl"

Are there any objections to pushing this change?  Do I need acks for this?

Thanks,
Cliff


