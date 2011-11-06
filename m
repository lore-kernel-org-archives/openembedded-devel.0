Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RN66U-0002S7-1B
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Nov 2011 18:01:54 +0100
Received: by qyc1 with SMTP id 1so2211662qyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2011 08:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=66XHqLj16eZiTyPC5vBB1xZLJDtkiog4Z/1PhRPDprM=;
	b=KTZlnjEfVOYcBNKlMo/M+CMxjuQSu0a/Y7brFXVJlhdAeM2dOgRBGcltfBK9dx5gW4
	6jSZw13lWCn9vufgQskfOBUNgpFU0jxnztt4BsADkrF4t4N9vPJDIfJNbsFQhpkwr775
	CJY1iOicXhi4avooy6MrOrOhzQHSzKovLpssU=
MIME-Version: 1.0
Received: by 10.229.64.134 with SMTP id e6mr2808504qci.150.1320598539967; Sun,
	06 Nov 2011 08:55:39 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sun, 6 Nov 2011 08:55:39 -0800 (PST)
In-Reply-To: <CAPOJ94McqGvz50v6oDkSjY1s5Lx+=x_L+k=wtPy9vor4pFcOmg@mail.gmail.com>
References: <CAPOJ94McqGvz50v6oDkSjY1s5Lx+=x_L+k=wtPy9vor4pFcOmg@mail.gmail.com>
Date: Sun, 6 Nov 2011 09:55:39 -0700
Message-ID: <CA+M6bX=UHG20Am7X9K9QZqe3Hp8Jwjmp7TN7OkR=wX9jOcx7pQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: cloud9 patch incompatible with fedora patch utility
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
X-List-Received-Date: Sun, 06 Nov 2011 17:01:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 5, 2011 at 3:13 PM, Peter Bigot <bigotp@acm.org> wrote:
> The patch in
> http://comments.gmane.org/gmane.comp.handhelds.openembedded.scm/49645incl=
udes
> /../ as a path component; as noted in
> http://lists.linuxtogo.org/pipermail/openembedded-users/2011-March/001249=
.htmland
> not resolved otherwise that I could find, this construct will not work
> on Fedora 14 or 15 because a security patch prevents application of patch=
es
> that include up-directory components in the paths.
>
> My bitbake skills are not presently up to cleanly creating and applying a
> patch to a file outside the S directory; how should this be fixed? =A0(I'=
m
> hoping for something other than "don't use Fedora".)

Modify the patch so that it doesn't use '../' and then add
';patchdir=3Ddir' to the line in SRC_URI.  dir here should be relative
to S, iirc.  A quick 'git grep' should show a few other examples of
this usage today.


--=20
Tom


