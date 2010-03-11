Received: from mail-qy0-f178.google.com ([209.85.221.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <perezmeyer@gmail.com>) id 1Npi3D-0007ur-3M
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 14:03:48 +0100
Received: by qyk8 with SMTP id 8so7264110qyk.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Mar 2010 05:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9JV79uQOSDLNlF3Ign8R+kn66MsJdEmBEoWqNsWRlOk=;
	b=k1tcp4lpobLR6xrJQ5T6aqfEvuA15q5wKHN6TOkRWvgblfcMrfAkGCB5AKUN8cvW90
	UXunt5xLwMF3zipDZlX/vTEfS8SR8Cr2DcxWcYqcd+c+RCzDI9jib+OOnXguUUcCHhg3
	wsr6OCsTBM7oodS+XN1hTfwCI50J7PB+qonY8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=d0XRySRsRwARvmAqLe9+cEvMLPJxsY7m2lL85zV70RcewiPm0KEuY/oIPnYlNc2HGn
	MQCe8motq0jWRSJXKtobOLi3LdXvpy4kG1tSA0y7kC8gjEPfUksmJYLt4V1GwWB/3RN2
	sMEDVQQxJTktsKEEh99BNv9sizUt95+4WjL2c=
MIME-Version: 1.0
Received: by 10.229.250.149 with SMTP id mo21mr10873qcb.65.1268312443689; Thu, 
	11 Mar 2010 05:00:43 -0800 (PST)
In-Reply-To: <1268308880.3822.63.camel@balakrishnan-desktop>
References: <mailman.3.1268305202.10009.openembedded-devel@lists.openembedded.org>
	<1268308880.3822.63.camel@balakrishnan-desktop>
Date: Thu, 11 Mar 2010 10:00:43 -0300
Message-ID: <8184c1ed1003110500p4fc5c744hf59eca20c61fb789@mail.gmail.com>
From: =?UTF-8?Q?Lisandro_Dami=C3=A1n_Nicanor_P=C3=A9rez_Meyer?=
	<perezmeyer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.178
X-SA-Exim-Mail-From: perezmeyer@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: xtscal issue... (Balakrishnan)
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
X-List-Received-Date: Thu, 11 Mar 2010 13:03:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thursday 11 March 2010 09:01:20 balakrishnan wrote:
 [snip]
> yeah, with the tslib only I have calibrated my touch screen. But in
> default tslib binaries are not built with rootfs, so I have updated
> tslib.inc like below
>
> /************************************************************************=
**
> */ FILES_${PN} =3D "${libdir}/*.so.* ${libdir}/ts/*.so* \
> 	       ${sysconfdir}/ts.conf ${sysconfdir}/profile.d/tslib.sh
> ${datadir}/tslib \
> 		${FILES_tslib-dev} ${libdir}/ts/*.la \
> 		${bindir}/ts_calibrate \
> 		${bindir}/ts_harvest ${bindir}/ts_print ${bindir}/ts_print_raw
> ${bindir}/ts_test "
> /************************************************************************=
**
> *****/
>
> But still binaries are not copied correctly to the final rootfs.

You can add the binaries adding them to the image recipe:

IMAGE_INSTALL +=3D " tslib-conf \
    tslib-calibrate \
    tslib-tests \
    "
Maybe not all of them are needed in the recipe (due to dependencies).

Check regulus-basic-image.bb in the git repo I gave you.

Regards, Lisandro.

--=20
Lisandro Dami=C3=A1n Nicanor P=C3=A9rez Meyer
http://perezmeyer.com.ar/
http://perezmeyer.blogspot.com/


