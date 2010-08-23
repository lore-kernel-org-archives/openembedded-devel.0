Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OneG7-0002Mo-7U
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 23:08:52 +0200
Received: by iwn2 with SMTP id 2so3286499iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 14:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=UEbJfivPG0TacmMdd8tz1bkn1+xXonheiGNsaGHXWKo=;
	b=sPIHDd9cNvjKKUAKO0rGR5sDs3tmmiI3DTyq8dL1oZNfyI388acd9pO9AcDKu+DsjH
	k+/0g5gE5M7HwWD3TfyAdfrB1sxTD9g408iCEchpKTO1NhykZTvj8xulO7Mlf7ODRswS
	XVOtmYEAvcrzxQipSAAdx+6PefKImn1oGqrBs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ItwdSNCoryA85hxqd4nuCvnCyITSBmFzFNFzFWEVR6ahwqr1+ZDW3yoZoPHE214rHC
	TO9oKwot8Tl5gXWndN4e/4E3WhCSXU1C6dnSg8uK0hPEKFK7BYcN9vzSIBCEb8gKsF/a
	UFIla0iDoZHfEEXt4yO31Lg0ckdrSP7XScYfw=
Received: by 10.231.166.72 with SMTP id l8mr7293692iby.95.1282597703255; Mon,
	23 Aug 2010 14:08:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Mon, 23 Aug 2010 14:08:03 -0700 (PDT)
In-Reply-To: <AANLkTimXc3kLFR1m1uXM6OXZQn3idnbiDcEHPU0wpwEC@mail.gmail.com>
References: <AANLkTimXc3kLFR1m1uXM6OXZQn3idnbiDcEHPU0wpwEC@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Aug 2010 14:08:03 -0700
Message-ID: <AANLkTikd-_vDny=kJKeS+NVWeYyfxiE_yXdUE+t1ac48@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: script to remove orphaned files
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
X-List-Received-Date: Mon, 23 Aug 2010 21:08:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2010 at 1:19 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Dear all,
>
> As I indicated before there are quite some orphaned patch files that
> are not used in any recipe.
>
> To resolve this I've written a small bash script to remove unused
> patches/files from a directory.
> Below is a copy of the script.
> This is posted to get feedback on the script (with the review comments
> added this can probably be put in the contrib dir).
> If the script is considered to be good, we can run it on the
> directories that we have to clean them up.
> My preference is that recipe owners do this, but as a lot of dirs are
> orphaned, I am planning to do this myself in due time (after the
> review and after giving recipe owners a chance to do it themselves).
>
> Attached is the script. It takes a recipe dir as argument (e.g. recipes/g=
cc)
> It searches for all .patch and .diff files in that dir, and checks if
> they are mentioned in a .bb file or .inc file
> if the file is there, nothing is done.
> If the fileis not there and there is a -d argument before the dir
> name, the files are actually removed and the change committed.
> Otherwise this filename is just listed.
>
> Proposal is to start with a 1 week script review period.
>
> Frans.
>
> The script:
>
> #!/bin/bash
> # clean-recipe: a small shell script to clean unneeded patch/diff
> files from a recipe folder
> if [ $# -eq 0 ]
> then
> =A0 =A0echo "usage " $0 "[-d] recipe-dir-name"
> =A0 =A0exit
> fi
> delete=3D0
> if [ $1 =3D "-d" ]
> then
> =A0 =A0delete=3D1
> =A0 =A0shift;
> fi
> dir=3D$1
> if [ ! -d $dir ]
> then
> =A0 =A0echo $dir " is not a directory"
> =A0 =A0exit
> fi
> cd $dir
> removed=3D0
> find -name "*.diff" -o -name "*.patch" | (while =A0read name
> =A0 =A0do
> =A0 =A0 =A0 =A0bname=3D`basename $name`
> =A0 =A0 =A0 =A0grep -q $bname *.bb *.inc || \
> =A0 =A0 =A0 =A0if [ $delete -eq 0 ]
> =A0 =A0 =A0 =A0then
> =A0 =A0 =A0 =A0echo $name " is unused"
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0git rm $name
> =A0 =A0 =A0 =A0removed=3D1
> =A0 =A0 =A0 =A0fi
> =A0 =A0done
> =A0 =A0if [ $removed -eq 1 ]
> =A0 =A0then
> =A0 =A0 =A0 =A0echo $dir ": removed unneeded files" | git commit -s -F -
> =A0 =A0fi )
>

Sometimes I run into a issue and then I look into the existing patches
and apply it or port it forward/backward
that solves it. This will be not easily possible once these patches
are removed. but thats not such a big issue I do
not have a strong opinion on this either way.



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


