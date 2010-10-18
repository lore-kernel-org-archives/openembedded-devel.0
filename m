Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P7zGZ-0005Of-FV
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 01:37:21 +0200
Received: by ywl5 with SMTP id 5so885484ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 16:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=ribi0HtxqZTuFtQPqKZeOZ/4NDFYItR0KXxyZVfN+GA=;
	b=xKy5uGWd3GRYmnOz+NDq7Pk0qIyHfbzSK1QzJrsrw2yMxMlgUngDp3saAm5UOXDUdo
	mt8Hh3PJaD9KFbiz5Ujb1B/9ea1/wB3Kgi9LLUybCKw1+2fieCJXr9vfYVp8DkoKp9BN
	oGY5CLBTp8uELotOjeBkRsc0Bzlsuw0OwzeJ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=FY3hb/X5bX+OvV2Vfb6XzaPKCvV40EioM99Sqsh/9QS1zTBNFooelOoPAeNrMqT8MT
	A2TlSw35Iql3zt4LBQshP+WYtL2Ie7p1KDN7vZ4lhpHzy3cWh1VVKLtIHB3vFI6m9nWR
	JmFHR3w3S4vAJhv09n6V0U3C/8QrxBqox9C9w=
Received: by 10.90.54.1 with SMTP id c1mr2175386aga.25.1287445001151; Mon, 18
	Oct 2010 16:36:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Mon, 18 Oct 2010 16:36:20 -0700 (PDT)
In-Reply-To: <1287444108.3927.82.camel@mattotaupa>
References: <1287444108.3927.82.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Oct 2010 16:36:20 -0700
Message-ID: <AANLkTimti+Lv7xzDUrq8MppJdkru3pZgLi3CmMvEwop1@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: openldap_2.4.23: `do_configure` fails with `cp: cannot stat `/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/share/libtool/ltmain.sh': No such file or directory`
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
X-List-Received-Date: Mon, 18 Oct 2010 23:37:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2010 at 4:21 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks,
>
>
> trying to build OpenLDAP to test 980a1e [1], task `do_configure` of
> `opldap_2.4.23.bb` [2] fails with the following error with `minimal`
> (eglibc) and `angstrom-2008.1` for `MACHINE =3D "beagleboard"`.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[=E2=80=A6]
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Log data follows:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| cp: cannot stat `/oe/build-minimal-eglibc/mi=
nimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/share/libtool/ltmain.sh': No=
 such file or directory
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| ERROR: Function do_configure failed
> =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: package openldap-2.4.23-r2: task do_conf=
igure: Failed
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR: TaskFailed event exception, aborting
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR: Build of /oe/openembedded/recipes/openl=
dap/openldap_2.4.23.bb do_configure failed
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR: Task 11 (/oe/openembedded/recipes/openl=
dap/openldap_2.4.23.bb, do_configure) failed with 256
>

can you search where ltmain.sh exist in your target staging ?
find /oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi
-name "ltmain.sh"


>
> Thanks,
>
> Paul
>
>
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D980a1=
ea8d5bbe2c0c6e4b8f79883b0f294de979b
> [2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/openl=
dap/openldap_2.4.23.bb?id=3D980a1ea8d5bbe2c0c6e4b8f79883b0f294de979b
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


