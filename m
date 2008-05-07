Received: from [64.233.184.225] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JtmOl-0007KZ-H4
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 May 2008 18:21:45 +0200
Received: by wr-out-0506.google.com with SMTP id 36so155023wra.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2008 09:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:references;
	bh=HSfsQHYq/2Y1vp86pj30aqLjz0CutbpIU+0nud+Z1zI=;
	b=LLTgTQm+YVIUQO+cO0n+DtYPSZ7aMqe4ZZUY250CLPqinpDPJq8V0Crp+0C9M4EUhgr700E2rxcYESfRLI1rPE/nbRf4Xd8ImekSMEkNBbQ2rFVui35Fd/qm+0yBQE89OM+dnIEyXv4GOZQnt9kGP5tu/b7AiRIv86fk8xRMznY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:references;
	b=Uwb8YRB5YTNklSmfxcsiqP8EeyYSo4867Uhkc5aJz5RBvfBLYBQjpJCLuH1WdbTNyVPwTu+3bL4TdmnPQ0YHyqr5trBYoJMWOYlviURnL8QYiFt4bxv8q3y7cKPd4MLaAmb0hx71SOm26xZ2G1E7kbKdHb5K5c19F3DF174tGO0=
Received: by 10.115.76.1 with SMTP id d1mr2072125wal.228.1210177268648;
	Wed, 07 May 2008 09:21:08 -0700 (PDT)
Received: by 10.114.149.20 with HTTP; Wed, 7 May 2008 09:21:08 -0700 (PDT)
Message-ID: <19c1b8a90805070921j7e4355a6vd2ff2bb4649e3a25@mail.gmail.com>
Date: Wed, 7 May 2008 09:21:08 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <35a670560805070733s30f077dcu92729e5f2356f0c1@mail.gmail.com>
MIME-Version: 1.0
References: <35a670560805070733s30f077dcu92729e5f2356f0c1@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.10b4
Subject: Re: GCC 4.3 fails to build glibc(-intermediate)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 07 May 2008 16:21:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

any compiler ICE is a compiler problem. You can reduce the testcase and may
file a bug in gcc bugzilla.

Khem

On Wed, May 7, 2008 at 7:33 AM, Matthijs van de Water <
matthijs.van.de.water@gmail.com> wrote:

> Hi,
>
> I'm trying to get an ARM EABI build based on gcc 4.3 working. I'm not
> having much luck with that so-far.
>
> The build fails at glibc-internal (tried both 2.6.1 and 2.7) with an
> internal compiler error:
> ../iconv/skeleton.c: In function '__gconv_transform_ucs4_internal':
> ../iconv/skeleton.c:801: internal compiler error: Segmentation fault
>
> Am I missing something? Any ideas?
>
> Regards,
>
> Matthijs van de Water
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

