Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PggwU-0003Oy-JJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 18:08:02 +0100
Received: by ywi6 with SMTP id 6so952466ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 09:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QuVWJsFJkNIWTAJRvgWoLA1wK8ZuITuw8M5qy7pWLVc=;
	b=IlOxtxWebzsLncIkW/ZC/PCyOTQQxgU4Nk0EcLtQGUynpTzAELrgLfJgi+3aVzc6J8
	V+0bFGFaqWGQaqJYhdatOMYfOJINZM8o2XtQiOQCHgeNqrOLtMB4X067nmKWrGXW+FKD
	tZazY4mB/waXIdx7dLr94wQqack7ZNNEiB1NI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=J3G+X/VGaLbxa9AAY2QTQ5HUe9C4Rqkagwoso+Tx+yrJI5CeeKpF46H9bSMNC/+WQZ
	UphtvyRZSsWeL9Sw6XlSGN/wA/kICicbtHDRevL7qHkmPSMohDvlEFiEAUw2kzPfsjZo
	mnSymdr3CFBfbvbIe42euM2BmHP+5ljFttAKk=
Received: by 10.91.163.27 with SMTP id q27mr2503927ago.139.1295716038983; Sat,
	22 Jan 2011 09:07:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Sat, 22 Jan 2011 09:06:58 -0800 (PST)
In-Reply-To: <201101221206.32796.pieterg@gmx.com>
References: <201101221206.32796.pieterg@gmx.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Jan 2011 09:06:58 -0800
Message-ID: <AANLkTing4dVzfMn6p4rcx0uxefyX=uYmv=ER3v+ykzW7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: e2fsprogs util-linux-ng dependency
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
X-List-Received-Date: Sat, 22 Jan 2011 17:08:02 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 22, 2011 at 3:06 AM, pieterg <pieterg@gmx.com> wrote:
> in http://git.openembedded.org/cgit.cgi/openembedded/commit/recipes/e2fsprogs?h=org.openembedded.dev&id=ef73bcd899aaf182fb596e5912c20f966e0e6951
> a util-linux-ng RDEPENDS was added to e2fsprogs.
> But, the comment suggests that only util-linux-ng-blkid would be needed:
>
>> # blkid used to be part of e2fsprogs but is useful outside, add it
>> # as an RDEPENDS_${PN} so that anything relying on it being in e2fsprogs
>> # still works
>> RDEPENDS_e2fsprogs = "util-linux-ng e2fsprogs-badblocks"
>
> util-linux-ng itself does not contain blkid, but a lot of unrelated utils
> However, it RDEPENDS on other util-linux-ng- packages, among which util-linux-ng-blkid.
> So eventually also util-linux-ng-blkid is installed.
> But I'm wondering whether it was not intended to just RDEPEND on util-linux-ng-blkid, so we can avoid dragging in a large number of unrelated utils?


hmmm good point. I think it should just rdep for things which its
missing or needs to run
its own provided programs at runtime

>
> Rgds, Pieter
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


