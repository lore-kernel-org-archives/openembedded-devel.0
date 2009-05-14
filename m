Received: from [74.125.78.146] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1M4Wiz-0000ha-UP
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 May 2009 10:55:45 +0200
Received: by ey-out-1920.google.com with SMTP id 26so509859eyw.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2009 01:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=n5frsDIs9TUBpPiADemvpOxSPpxnIfE+wKB5fv3fh0k=;
	b=kIOXKXIjZR3bczwtKUurrNm8KfZQzJTlgSjIwKioRKWOvvimsgVlwXoE8taWT9xflF
	ZC57jtwjfvioh9+lQ3pjLpd8jhJ2JsEKaBQLInzPeUQ1/QActVywqk0tQnQe0hV4Xv2j
	7ggepKLJbxpOcGEm3iUuv3jCWnUOVuRnceOv8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Q08WOBKTsIuify7KLJEIjyavCg5SfDUk/wHJhlIBffJfmedDbzeCePD//tgMgiEivY
	pbnGD268H5VJ4TGH5ghkwu+kDEX0mqwvStN1YougFAqCKsXhXcPNZlyGPtB9OyFbZJV7
	M8zNjV6dSmTNFAwk05Q9qlZQa9n2zVfyURayc=
MIME-Version: 1.0
Received: by 10.216.16.212 with SMTP id h62mr757404weh.201.1242290924121; Thu, 
	14 May 2009 01:48:44 -0700 (PDT)
In-Reply-To: <1242288896-6347-3-git-send-email-elena.valhalla@gmail.com>
References: <1242288896-6347-1-git-send-email-elena.valhalla@gmail.com>
	<1242288896-6347-2-git-send-email-elena.valhalla@gmail.com>
	<1242288896-6347-3-git-send-email-elena.valhalla@gmail.com>
Date: Thu, 14 May 2009 10:48:43 +0200
Message-ID: <5c5e5c350905140148g778799erb4ed9dd84ad15e40@mail.gmail.com>
From: Elena of Valhalla <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gtksourceview: renamed the 1.x tree to gtksourceview1
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
X-List-Received-Date: Thu, 14 May 2009 08:55:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Sorry, I did something wrong with git-send-email and this part wasn't sent:

GtkSourceView[1] currently maintains a stable 2.x tree and an old stable
1.x tree for compatibility with older applications[2] and they can be
installed together on a computer.

I need to add the recipe for the latest 2.x version, and since the old
stable is used just in 2 recipes (gobby_0.4.1.bb and tea_17.3.5.bb) and
mentioned as a preferred version in preferred-om-2008-versions.inc
it seems to me that this could be a good time to rename it to
gtksourceview1 with minimal breakage.

(I also hope I've used correctly the git tools for patch sending by
email: sorry if I've done something wrong)

[1] http://projects.gnome.org/gtksourceview/
[2] http://projects.gnome.org/gtksourceview/download.html


-- 
Elena ``of Valhalla''

homepage: http://www.trueelena.org
email: elena.valhalla@gmail.com


