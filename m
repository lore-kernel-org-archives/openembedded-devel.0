Received: from [209.85.200.172] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LxtzZ-0006hL-Ry
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Apr 2009 04:21:18 +0200
Received: by wf-out-1314.google.com with SMTP id 25so1549448wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Apr 2009 19:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=WcfSt9dxWjUGJBJJd7NN1xNZs3RPqXbtbIJm3ApMREQ=;
	b=xUuYHLn6GsTq1z/eLt+ooPcYYqNKOO2mQ/XVMGhB6TzT7imvl1XChXSpSkguGNLRBb
	WxxSlxvJmWssiU+BRMn6nJrIm18Wi8Dl5D+8G4zP9mXhS113z+MNznqC0yTuykvYlKOq
	XBOrq3gmApfelXQkdCgH19YhSCB/Yg1vaAWeE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=NsW1XANVREWLZ3apKQBt1hHEBkM5B6GxTIkyQA/QT6v+V02Ujj/y0eya03IEoR2iLd
	Nun9u2gpJaYUSVRQX9johP0PkK3DFXds1zVa301s0UN70PBDwOS+LwG1B6a1LF9xNOXp
	T5AJBVgc2OchcWG1e1JUuyx8yBQDu1AG0uOv4=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.242.11 with SMTP id p11mr972814wfh.234.1240712183785; Sat, 
	25 Apr 2009 19:16:23 -0700 (PDT)
In-Reply-To: <200904252358.02016.marcin@juszkiewicz.com.pl>
References: <200904252358.02016.marcin@juszkiewicz.com.pl>
Date: Sat, 25 Apr 2009 19:16:23 -0700
X-Google-Sender-Auth: 6cdf46b7ee199f8c
Message-ID: <b6ebd0a50904251916o501ae804vdb4008414cca6963@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Removing GIT branches
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
X-List-Received-Date: Sun, 26 Apr 2009 02:21:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

git push remotename :remotebranch

You're pushing "nothing" (the left side of the : separator) to the
remote branch, which is removal.

On Sat, Apr 25, 2009 at 2:58 PM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
>
> Hi
>
> Can someone remove hrw/poky-merge/add-rpm-packages-support and
> hrw/poky-rpm branches? They are obsolete now as code from them
> is merged into .dev already.
>
> Regards,
> --
> JID: =C2=A0 =C2=A0 =C2=A0hrw@jabber.org
> Website: =C2=A0http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


