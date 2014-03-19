Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9A4086E747
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 13:56:18 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id y1so6056542lam.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 06:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LXVaj/tZdM9AOeC7By613H3kK8XWzMmtgNcNh6Ix/w0=;
	b=hoO0QWP7jgEOd485HX9VbeWQ5VX3H1qZKwPiiS4xw+I3NM/+OK3FWnmzZCLoWR/y5k
	tFkMTMlgsm8279KtOvD5fxUaFg5AuZu+iHZPxu+xCc9Zzbj3gJi38ejmC1QV1aA0mR4o
	Di5NGQ8Vc7wHqrQDLdSdwsN1iD2eQM0q7hSJBI0jRISOvpzBnjj2vceO4i3piZKmiGQ8
	s9J5dDeXXiMqga/HoSMjISudZgOeqcLAw0bPFiAqYWrZosSUTfNybj41uDtGwhxMPVBP
	tUHC0n+7BEcNjaCXuyWWSdZJglq4q70ZltXMShW2gXevJNvumID1InwseHMykWZYWB5n
	HaoQ==
MIME-Version: 1.0
X-Received: by 10.112.254.163 with SMTP id aj3mr24516924lbd.20.1395237378127; 
	Wed, 19 Mar 2014 06:56:18 -0700 (PDT)
Received: by 10.112.53.73 with HTTP; Wed, 19 Mar 2014 06:56:18 -0700 (PDT)
In-Reply-To: <2836509.grP80ui5Ay@koontz>
References: <1395236677-28379-1-git-send-email-sgh@sgh.dk>
	<2836509.grP80ui5Ay@koontz>
Date: Wed, 19 Mar 2014 14:56:18 +0100
Message-ID: <CAPbeDCkN2jeKJr-+0hV0DWvJ1v26a8WYHb3wn1u1Novssa7_=Q@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: sgh@sgh.dk
Subject: Re: [meta-qt5][PATCH] qtbase: Add libxi to depends.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Mar 2014 13:56:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Maybe do something this instead ? This is only necessary for X11 right ?

-DEPENDS +=3D "qtbase-native"
+DEPENDS +=3D " \
+    qtbase-native \
+    ${@base_contains('DISTRO_FEATURES', 'x11', 'libxi', '', d)} \
+"

/Jacob


On Wed, Mar 19, 2014 at 2:45 PM, S=F8ren Holm <sgh@sgh.dk> wrote:

> I'd like this to go into dora if possible.
>
> Sorry for the double posts :)
>
> --
> S=F8ren Holm
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



--=20
  -- Jacob

