Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OfUJ0-0007Ay-JM
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Aug 2010 10:54:03 +0200
Received: by iwn34 with SMTP id 34so3002518iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Aug 2010 01:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=byN5T4W/HtoZ0V/9LausgFL3Hn3oPV0Eg6q88hg61AI=;
	b=rGTsejG0cqINPVrK0wDe9tVkfIixPz+MmfjrItObz56jvPOzfoQbvVDQa0lHL/1hu2
	IR1iHYSbE9UrqOY31+g+b7gj7+klek1rG6aX7riizZt4pN1maz7nX2T98V4CPJh2vrEC
	wRUeLf3jQ8Shtjj86quhhaa8bhfiQG3zt4dZw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ers8hK3eUkpqrTErJpSkiNMec2ad5U7zpd5E2ZN0BHVNpHuV6p8Ok932tnVDd1GgXJ
	ko0FBBQ6QCTcsZXSW99YZN+hyjUoItoMxlg9gRjIm5c5pzt++wrFXjl47MeYH1N2V/MV
	L79qjCXx23VNvz1W8Bcc79Y/TuMsrw9y1cbko=
Received: by 10.231.194.219 with SMTP id dz27mr4856198ibb.104.1280652815249; 
	Sun, 01 Aug 2010 01:53:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.199 with HTTP; Sun, 1 Aug 2010 01:53:15 -0700 (PDT)
In-Reply-To: <6E215953-4068-4742-8423-E2CD9CA779D8@mac.com>
References: <A806EA3C-FD29-40A7-82E7-9391241EF930@mac.com> 
	<AANLkTim_ffCU8p0VGgcZmuiN1q8cj6f3NS7=m2Bb8vSL@mail.gmail.com> 
	<6E215953-4068-4742-8423-E2CD9CA779D8@mac.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Aug 2010 01:53:15 -0700
Message-ID: <AANLkTimDbBUPnQYvNENKLAaE9+=Hf9YW7r-pr9HeyagA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Is bitbake 1.10 the latest stable version?
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
X-List-Received-Date: Sun, 01 Aug 2010 08:54:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 31, 2010 at 4:35 AM, Elvis Dowson <elvis.dowson@mac.com> wrote:
> Hi,
> =A0 =A0 =A0 If you ask me, updating bitbake and openembedded is bound to =
cause problems !
>
> I was running bitbake 1.8 and oe from about 3 months ago, but when I trie=
d updating it to bitbake 1.10 and did an update of my oe repo, I had failur=
es for glibc, =A0complaining about LD_LIBRARY_PATH being set to the current=
 directory.
>
> It is not the first time that this is happening, everytime you do an upda=
te of the oe repository, things start going wrong and you usually have to s=
pend a whole week trying to fix things.
>
> Luckily for me, I had a backup copy of my Fedora 12 x86 64-bit virtual ma=
chine, and now have switch to the older repository and working revision.
>
> The resulting outputs of the OE build system are reproduceable, but OE be=
haviour by itself =A0across revisions is not.

if you use development branch then be ready to bear these kind of
issues occasionally otherwise use stable branch and in general OE
master is a lot better in consistency compared to many other projects

>
> Best regards,
>
> Elvis Dowson
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


