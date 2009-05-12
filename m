Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1M3uGG-0003cP-Jg
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 17:51:21 +0200
Received: by yx-out-1718.google.com with SMTP id 36so27362yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2009 08:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nkanajkhPzbsYjK2MPDMTofn4nSO3eexMi2HWEaSgBU=;
	b=ZIMvgCNs7dwBu6yIvH16341WIx9oRUz3OiIsSq1Vfv7h6agRNO0+F74qk+w9th3t4d
	wKSb9evh14Gy4ywGWs1ubLKwZm3NNDIedZujwr3srObRQffx2dU2ZGVhLmOLZUeFF93N
	4+/+eqhHFmV89zcw100c6hhjJOwWZYoYbBaxU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jSLvlDuftOD0Ry0iqRMnyX6+EEWIWoUZSmQHtd+EPK12AK2r1Ev3HZyKb++PhW5TTl
	58Jw/cQ5wc0NqpzDKBMOwFflmrZ/zKh4CLKzIOBWTGgYAVz3659c40X164tyDLu8qypK
	Sy1V35lqYVjRUGYCNGsjODCACEFZNxBbC/QC0=
MIME-Version: 1.0
Received: by 10.150.148.7 with SMTP id v7mr12595ybd.66.1242143082186; Tue, 12 
	May 2009 08:44:42 -0700 (PDT)
In-Reply-To: <20090511172937.GA23731@denix.org>
References: <alpine.DEB.1.00.0905111020490.11037@localhost.localdomain>
	<20090511172937.GA23731@denix.org>
Date: Tue, 12 May 2009 08:44:42 -0700
Message-ID: <f46da1cf0905120844m41413452o2eb88da084bc5c06@mail.gmail.com>
From: "Theodore A. Roth" <taroth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] evtest: Fixed GNU_HASH QA error.
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
X-List-Received-Date: Tue, 12 May 2009 15:51:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2009 at 10:29 AM, Denys Dmytriyenko <denis@denix.org> wrote=
:
> On Mon, May 11, 2009 at 10:23:18AM -0700, Theodore A. Roth wrote:
>>
>> Signed-off-by: Theodore A. Roth <taroth@gmail.com>
>
> Acked-by: Denys Dmytriyenko <denis@denix.org>

I do not have commit access so someone will need to apply this.

Thanks,

Ted Roth

>
>> ---
>> =A0recipes/evtest/evtest_1.23.bb | =A0 =A02 ++
>> =A01 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/evtest/evtest_1.23.bb b/recipes/evtest/evtest_1.23.=
bb
>> index 4c5d195..6cf87be 100644
>> --- a/recipes/evtest/evtest_1.23.bb
>> +++ b/recipes/evtest/evtest_1.23.bb
>> @@ -11,6 +11,8 @@ PR =3D "r0"
>> =A0SRC_URI =3D "http://beagleboard.googlecode.com/files/evtest.c"
>> =A0S =3D "${WORKDIR}"
>>
>> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
>> +
>> =A0do_compile() {
>> =A0 =A0 =A0${CC} evtest.c -o evtest -I${STAGING_INCDIR} -L${STAGING_LIBD=
IR}
>> =A0}
>> --
>> 1.5.4.3
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


