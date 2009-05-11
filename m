Received: from [209.85.128.184] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1M3dfs-0004GZ-3b
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 00:08:40 +0200
Received: by fk-out-0910.google.com with SMTP id z22so1384850fkz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2009 15:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TDOnfyCXynu9tUCmdwFgA8KXHRlcmLJV15T5BKwgN8M=;
	b=W8J/JOPOkxxJ9DVHACDDMgRKJ7VT05gZjM413G7NrwXYnWKqAM1whFryTv5neciEnj
	+s/ZVM2L9+bnXmBR+DUAf1itz3bE+RfFMIQk1E1jgnzbcfAcJ2F8SeEhR1e9s+mNvKP3
	2GpAQroEcpiNczOlUWaer4Zi1SqivtIrGBNyk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=bugQrRe9+qS5kcbf2ddPlmCXklTsmoA1/z+/w7emoOmRqKaMPBu/N3KnaHmxx4vcPZ
	SgDfE3ZrVAwHye1F5kKGNqWdsrus+Glfqaqt3Tt95rIRJEXp1Ud1R0pFKooJiGrVfJEi
	dibs2yFsWWGbC3+CFQpYJ5SOuDjY1F2PDz5rs=
MIME-Version: 1.0
Received: by 10.223.108.75 with SMTP id e11mr3856290fap.97.1242079326718; Mon, 
	11 May 2009 15:02:06 -0700 (PDT)
In-Reply-To: <d1b08f940905110131h13a6b314q64e74a2bd9919433@mail.gmail.com>
References: <d1b08f940905110131h13a6b314q64e74a2bd9919433@mail.gmail.com>
Date: Tue, 12 May 2009 00:02:06 +0200
Message-ID: <d1b08f940905111502r3b29564fy6e36d101934909e2@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: x11-gpe-java-image: gdk-pixbuf
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
X-List-Received-Date: Mon, 11 May 2009 22:08:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

diff --git a/recipes/maemo4/hildon-thumbnail_0.14.bb
b/recipes/maemo4/hildon-thumbnail_0.14.bb
index d3af031..06f8482 100644
--- a/recipes/maemo4/hildon-thumbnail_0.14.bb
+++ b/recipes/maemo4/hildon-thumbnail_0.14.bb
@@ -1,6 +1,6 @@
 require hildon-thumbnail.inc

-DEPENDS = "libosso gnome-vfs gconf gdk-pixbuf glib-2.0"
+DEPENDS = "libosso gnome-vfs gconf gtk+ glib-2.0"

 PR = "r1"


seems to solve the nasty dependency

BTW, this image needs more care:

andrea@mizar /oe/build $ bitbake -g x11-gpe-java-image
NOTE: Handling BitBake files: \ (6738/6738) [100 %]
NOTE: Parsing finished. 6474 cached, 0 parsed, 264 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for classpath (classpath,
classpath-minimal);
NOTE: consider defining PREFERRED_PROVIDER_classpath
NOTE: multiple providers are available for virtual/javac-native
(ecj-bootstrap-native, openjdk-javac-native);
NOTE: consider defining PREFERRED_PROVIDER_virtual/javac-native
NOTE: multiple providers are available for virtual/java-native
(cacao-native, jamvm-native);
NOTE: consider defining PREFERRED_PROVIDER_virtual/java-native
NOTE: multiple providers are available for virtual/java-initial
(cacao-initial, jamvm-initial);
NOTE: consider defining PREFERRED_PROVIDER_virtual/java-initial
NOTE: Preparing runqueue

Regards

Andrea


