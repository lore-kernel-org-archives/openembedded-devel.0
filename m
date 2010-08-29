Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpdNk-0000SU-At
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 10:36:53 +0200
Received: by iwn2 with SMTP id 2so3857156iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 01:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=sUpVY9jtsbTG/oUiwPHxPVpvIOP3wT5YOUDGHW+LKTw=;
	b=Yk/FtrJUtDzAYOxGxXtzC0wPF/ZSmTD4GVuLJ5MM/ktG4RomNBjm0aisa2yRy56rQE
	KImrlYcdD3cQbAFwrecgoFypgWXp0zjqhFD8SDa/TYc3ZPZP/JenTOqM+wfgL8D1oImC
	H8zMAhNbM/HnwRrr1WpVtJxBvwNkDinvkkgLE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=tIzTNOQtiB3UBpAJQTqUR5bm11WAnkOhuu9UU9jf4lCzXY+gejRTLvQvkrsVFQaoHt
	hWn72X1FvvE7ak0152GvU2IVbxcxNtYgNRq7ADN6f7myycszy0OChRDQar/dgR5T5vxD
	nj9No+t5zLQKS9s/0hjk1etwVBQRVt7hwrhsA=
Received: by 10.231.161.68 with SMTP id q4mr3621082ibx.79.1283070983142; Sun,
	29 Aug 2010 01:36:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Sun, 29 Aug 2010 01:36:03 -0700 (PDT)
In-Reply-To: <4C79C7C4.1050304@mwester.net>
References: <4C79C7C4.1050304@mwester.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 01:36:03 -0700
Message-ID: <AANLkTik+337JgWFTCTheEmHa899dXto7vT57Q-Pzx7P+@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ncurses 5.7 doesn't build libtermcap anymore?
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
X-List-Received-Date: Sun, 29 Aug 2010 08:36:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 28, 2010 at 7:36 PM, Mike Westerhof <mike@mwester.net> wrote:
> I've been working on some recent problems that popped up in the SlugOS
> feeds; one that appeared recently is that asterisk no longer builds;
> configure complains about -ltermcap, and investigation shows that
> indeed, libtermcap is missing. =A0It seems that the new ncurses recipe
> (5.7) no longer builds it for some reason. =A0I think the same problem is
> the root cause for the failure of js to build as well.
>
> So I guess the first question is if this is intentional or not? =A0If it
> is, then I guess I'll modify the asterisk recipe to remove the
> dependency and submit that patch. =A0Otherwise, well, I guess I could
> attempt to debug and fix the ncurses recipe, but it looks a bit, um,
> "non-trivial" so any advice would be appreciated.
>

AFAICT libtermcap is now in libncurses. so either we can create a
symlink called libtermcap.so pointing
to libncurses.so or we can fix the recipes to link with -lncurses
instead. I think first approach might be
better.

> Or should I just pin ncurses to the old 5.4 version that worked?
>


> Thanks,
> -Mike
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


