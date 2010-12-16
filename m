Received: from mail-gw0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PT1ds-0003Ro-7x
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 01:24:20 +0100
Received: by gwj22 with SMTP id 22so1689703gwj.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 16:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=BipmYkpYG+lpMB750mdfXytJXWdjTmcX+h1injA9c+I=;
	b=xaroF3t7uCAx7eroAamFNehELn+EIy5309Qvatz95U+bqt6KXObibTD6g3SEv7lgN2
	MhZbaQl+k5EOzaK9RvxHI73VCyVzAkF3+m6neMlC7oOwJRfzOoQqymYC4Q/Fp9h+1kgv
	LdVlBFKl/micAhV2UVcIibjlMiP4o7YogHxus=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=U76N6X8BhhT1zMWsMb6R+X2UyA2Man+YwxIPvmLMD3xbjdx2Dn33r5+MLApZ9ebr7z
	mXjgAqM1OfhbFLMWAZni+R2F64mdG+weO6IK6uQsFAb4j4c1XtiK5n9PKuNTIBexV6CA
	Xqk81biqjt1MXDxFhsGrr6GDiLlG1oMCRYmTA=
Received: by 10.90.120.17 with SMTP id s17mr9044926agc.193.1292458961050; Wed,
	15 Dec 2010 16:22:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 15 Dec 2010 16:22:20 -0800 (PST)
In-Reply-To: <AANLkTik_OhkXYdd658Job2F8w_6PkH9wr_NbV_X-=_vL@mail.gmail.com>
References: <AANLkTik3B0Boi4PuUqZiSd8no_BwBoSzcgWVmFcKcY3L@mail.gmail.com>
	<AANLkTinvRwriJ=W50duDtc50t2fCT5PM_3-D6Ec8VwM5@mail.gmail.com>
	<AANLkTi=ZP2qTYw3A6KGKppb82D-hoc1LQFQ2DGjbHxN0@mail.gmail.com>
	<AANLkTik_OhkXYdd658Job2F8w_6PkH9wr_NbV_X-=_vL@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Dec 2010 16:22:20 -0800
Message-ID: <AANLkTikkJXG3riNLq=4ZnE9N9zsruKNhdv8qA71M16q-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.41
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: task-sdk-native hard-coded to depend on sysvinit
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
X-List-Received-Date: Thu, 16 Dec 2010 00:24:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2010 at 3:24 PM, AJ ONeal <coolaj86@gmail.com> wrote:
> upstart's sysvinit-compat is part of my image and installed on the system=
.
>
> Or do you mean some other type of compat package?
>

no something like that is what I expected.

> AJ ONeal
>
>
> On Tue, Dec 14, 2010 at 1:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mon, Dec 13, 2010 at 2:19 PM, AJ ONeal <coolaj86@gmail.com> wrote:
>> > actually, the error only seems to happen when another package is
>> installed
>> > or when it is part of a my-custom-image.bb - which is a problem since =
I
>> want
>> > to install both it and upstart.
>>
>> if there are conflicts then probably you need something like a compat
>> package
>> where you can make sure that the bits that conflict are taken care of
>> upstart and sysvinit are conflicting
>> packages.
>>
>> >
>> > opkg install python python-misc task-sdk-native
>> >
>> > when I tried it all on it's lonesome it worked.
>> >
>> > AJ ONeal
>> >
>> > On Mon, Dec 13, 2010 at 2:27 PM, AJ ONeal <coolaj86@gmail.com> wrote:
>> >
>> >> Why should task-sdk-native depend on sysvinit in the first place?
>> >>
>> >> And in the second place, isn't there something like virtual/init that=
 it
>> >> should depend on instead?
>> >>
>> >> opkg install task-sdk-native
>> >>
>> >> Collected errors:
>> >> =C2=A0* check_data_file_clashes: Package sysvinit wants to install fi=
le
>> >> /sbin/telinit
>> >> =C2=A0 =C2=A0 But that file is already provided by package =C2=A0* up=
start-sysvcompat
>> >> =C2=A0* check_data_file_clashes: Package sysvinit wants to install fi=
le
>> >> /sbin/killall5
>> >> =C2=A0 =C2=A0 But that file is already provided by package =C2=A0* sy=
svinit-utils
>> >> =C2=A0* check_data_file_clashes: Package sysvinit wants to install fi=
le
>> >> /etc/init.d/rc
>> >> =C2=A0 =C2=A0 But that file is already provided by package =C2=A0* up=
start-sysvcompat
>> >> =C2=A0* check_data_file_clashes: Package sysvinit wants to install fi=
le
>> >> /etc/init.d/rcS
>> >> =C2=A0 =C2=A0 But that file is already provided by package =C2=A0* up=
start-sysvcompat
>> >> =C2=A0* check_data_file_clashes: Package sysvinit wants to install fi=
le
>> >> /etc/default/rcS
>> >> =C2=A0 =C2=A0 But that file is already provided by package =C2=A0* up=
start-sysvcompat
>> >> =C2=A0* opkg_install_cmd: Cannot install package task-sdk-native.
>> >>
>> >>
>> >> AJ ONeal
>> >>
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


