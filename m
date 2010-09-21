Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Oy9Pm-0005km-Ap
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 22:26:11 +0200
Received: by wyb34 with SMTP id 34so4230814wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 13:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=FWF27Cg2USGCu9neoI+tsowqVj3pPn6BhY36Z4O0xtM=;
	b=Y2ACIMopo6JEq2EWMh3WoCe5ToDK7saZZOYWQp35d7WtNhoOM7SjtKu74Pu23XJ/VV
	iy8kWsijeMVAO874WPKKuABGxNSincSNscztTwwgdzmACnD/E+1cuneIw25ApTCLlhC/
	KwWJ0pEVBLRlhkTM6vuQ8QfDp6FlYKQyuFowY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xLzXDlPc2mMU4j/C0LYP4C9tx1pEH5a77ze9/1CaZ+1rkfmlRIjqIxlox0+dVXDxtS
	E4vBCazePPStoQtvP5Gdg+q/Uy5DuoN6NSN6muUZ88p47S32AEbPL6q9t6Hew3cj3ICt
	2KyppsrNnCXC2Og2eYecSLi2oOWVGZITKkowM=
MIME-Version: 1.0
Received: by 10.227.132.67 with SMTP id a3mr3692518wbt.198.1285100766240; Tue,
	21 Sep 2010 13:26:06 -0700 (PDT)
Received: by 10.216.72.212 with HTTP; Tue, 21 Sep 2010 13:26:06 -0700 (PDT)
In-Reply-To: <20100921154038.GC3403@jama>
References: <AANLkTikDibG-qAf2b9U_OuOLbVXNP8QWouTEN7z_v25_@mail.gmail.com>
	<20100921152505.GB3403@jama>
	<AANLkTikTrRMX-5UAso2BgJ8-XqhwtXTnS_vT2Yt4FNnc@mail.gmail.com>
	<20100921154038.GC3403@jama>
Date: Tue, 21 Sep 2010 16:26:06 -0400
Message-ID: <AANLkTim9cs7=eKAV1T2ZWTd1HgAaXrxDUdcLUT8RahUF@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: anyone working on recipes for qt 4.7.0 released?
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
X-List-Received-Date: Tue, 21 Sep 2010 20:26:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2010 at 11:40 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Tue, Sep 21, 2010 at 11:34:23AM -0400, Cliff Brake wrote:
>> On Tue, Sep 21, 2010 at 11:25 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> > On Tue, Sep 21, 2010 at 11:21:32AM -0400, Cliff Brake wrote:
>> >> Qt 4.7.0 is now released:
>> >>
>> >> http://labs.qt.nokia.com/2010/09/21/qt-4-7-0-now-available/
>> >>
>> >> Is anyone working on recipes for this yet? =A0I've been trying to get
>> >> 4.7.0-beta2 to build, so wondering if anyone has tried 4.7.0 released
>> >> yet.
>> >
>> > 4.7.0-beta2 is building and working for me (SHR) fine, but no time to
>> > work on 4.7.0 now, so would be great if someone else does that.
>>
>> Just to verify and get a baseline, what all do you need to set to get
>> 4.7.0-beta2 to build properly. =A0I'm trying:
>>
>> ANGSTROM_QT_VERSION =3D "4.6.3+4.7.0-beta2"
>
> Yes, I also had to use newer postgresql before (not sure if it's still
> needed).
>
> http://gitorious.org/~jama/angstrom/jama-shr-experimental/commit/5fcd20c6=
e939edfec27fccce1e92f82cf0a78b17
>
>> Are you using the X11 or embedded version or Qt?
>
> only X11 version

X11 version built fine -- qt4-embedded failed:

http://bec-systems.com/oe/qt4-embedded-log.do_compile

We'll move on to the 4.7.0 released stuff next.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


