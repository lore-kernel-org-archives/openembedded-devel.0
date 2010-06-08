Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OLnSU-0002Yf-Fk
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 03:18:28 +0200
Received: by iwn6 with SMTP id 6so2070742iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 18:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=KtOcKLAkZF52plwpIeUMwav6Zm+kAWI7xl4WiYlt99U=;
	b=GDnlMIysJDuValgltZA8xPFskEKlYHdPuKl7h8vBhwR65eKmW67MiD7adsDm6OgyBt
	4l52rsry/A0YqVTp7prDVB2kcAhg0EE645TGZMaZ3CTeLyK6Qp2znyi0Sd9FPH5jtVI3
	IhTJ3KsgijMKKRkCqKnat9ES0t7b6mQOey7bs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=Wf1QbyLyrUez7y97KlZzyf7kDvCZ6h+dBQtmJF6991mwYVN+wOhUmRgHvkGRPiDrV+
	5jffSkcahV00ak563OIUf2g6covtpJWufjnDqOVVACLmCA8Qa31zp7ymN/caeyFZ12OI
	baJ+7ZU+5Rmv9Url+NkzRVt7kfJsujFf1baAM=
MIME-Version: 1.0
Received: by 10.231.148.145 with SMTP id p17mr6108034ibv.28.1275959647309; 
	Mon, 07 Jun 2010 18:14:07 -0700 (PDT)
Received: by 10.231.152.204 with HTTP; Mon, 7 Jun 2010 18:14:07 -0700 (PDT)
In-Reply-To: <20100602111548.GD16035@jama>
References: <20100602111548.GD16035@jama>
Date: Tue, 8 Jun 2010 10:44:07 +0930
Message-ID: <AANLkTin9MYaoT5Ec_u3bspTHtihF1L6E12xxdq8E_41R@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Opkg removing not-really-orphaned files during opkg upgrade
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
X-List-Received-Date: Tue, 08 Jun 2010 01:18:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2 June 2010 20:45, Martin Jansa <martin.jansa@gmail.com> wrote:
> Hi,
>
> few times I've run to strange issues with missing files after opkg
> upgrade, now I have simple case there I can guess what happened. Please
> comment if I'm doing something wrong or if it's known issue (but not
> fixed because it's to hard without changing lot of opkg internals?).
>
> /etc/pointercal.xinput is now installed by package pointercal-xinput and
> not xinput-calibrator
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dfb641200b6=
5b3d3c465332efb1febab7001eff47
>
> The problem which needs your manual intervention is when you see:
> Upgrading xinput-calibrator on root from 0.6.1-r1.4 to 0.6.1-r7.0.4...
> Downloading
> http://build.shr-project.org/tests/shr-unstable/ipk//armv4t/xinput-calibr=
ator_0.6.1-r7.0.4_armv4t.ipk.
> Installing pointercal-xinput (0.0-r0.4) to root...
> Downloading
> http://build.shr-project.org/tests/shr-unstable/ipk//om-gta02/pointercal-=
xinput_0.0-r0.4_om-gta02.ipk.
> Not deleting modified conffile /etc/pointercal.xinput.
> Configuring pointercal-xinput.
> Configuring xinput-calibrator.
> Collected errors:
> =A0* file_md5sum_alloc: Failed to open file /etc/pointercal.xinput: No su=
ch file or directory.
>
> Then opkg upgraded xinput-calibrator to version without
> pointercal.xinput and in the same batch installed new pointercal-xinput
> package providing the same file. And in the end removed
> /etc/pointercal.xinput file because it was "orphaned" from
> xinput-calibrator packages :/.
>
> Best way to fix this is to call
> opkg install -force-reinstall pointercal-xinput
> after opkg upgrade.
>
> opkg remove xinput-calibrator; opkg install xinput-calibrator; should
> probably also "upgrade" xinput-calibrator properly.
>
> Reagards,
>
> --
> uin:136542059 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0jid:Martin.Jansa@gmail.com
> Jansa Martin =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sip:jamasip@voip.wengo.fr
> JaMa
>

Hi Martin,
Sorry for the late reply... I didn't want to respond until I'd had
some time to analyse the problem.

I've added a bug report for this in opkg's issue tracker
http://code.google.com/p/opkg/issues/detail?id=3D50 and committed a fix
for the test case I came up with. Can you confirm that this fixes the
bug you are experiencing?

Thanks,
-Graham


