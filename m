Received: from ey-out-1920.google.com ([74.125.78.144])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1Npg0X-0002Eh-DK
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 11:52:50 +0100
Received: by ey-out-1920.google.com with SMTP id 5so551184eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Mar 2010 02:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Pm5jPHRRAt7nB9ZtpTRWU8sPjtP9NnY+Zzj346kt2YU=;
	b=Ce5B4JdEA+FF3eax/QzRSIIWoncN0CffrJTC4vGHCS31aFF6tjtAaPqwtZk8cv6eGf
	cznE6j9ScVLtYRXdTud5EAsjSxgwK22R+FQ+T6ACKiiVtQQnLTWWgMRpubEIdG8XFyFQ
	DqVCM/4fU3noTxT9PIbPusaynOgQinwaad2fU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=H/gvKQXeq5xupIWjoXBM7Qk9NK3SI+RgUZYPCFrrP2n7FHnniqzIA+yPnBGKrJSlVi
	ORy91HpD9D0WmoO+cMf33WDRyjJ0GjT0IrfpM9SBYwXGgfy+4ogktdlKosilzachVfj0
	2C0aEH7mJ1Q3wd3F8QOvFKlbfiufLQH3Wn/Bc=
MIME-Version: 1.0
Received: by 10.213.109.152 with SMTP id j24mr1896393ebp.25.1268304593289; 
	Thu, 11 Mar 2010 02:49:53 -0800 (PST)
In-Reply-To: <1268302784.3822.51.camel@balakrishnan-desktop>
References: <1268302784.3822.51.camel@balakrishnan-desktop>
Date: Thu, 11 Mar 2010 13:49:53 +0300
Message-ID: <48239d391003110249lf2c040fo4dd7bdcc1be8dc15@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.144
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: xtscal issue...
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
X-List-Received-Date: Thu, 11 Mar 2010 10:52:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2010 at 1:19 PM, balakrishnan
<balakrishnan@e-consystems.com> wrote:
> Hi,
> =A0 =A0 =A0 =A0I have faced touch screen calibration issue with Xorg-serv=
er 1.5.3.
> While running xtscal application, it is through following error
>
> **XCALIBRATE extension missing: Success**
>
> How can I resolve this? and calibrate touch screen.
use ts_calibrate from tslib, or use Kdrive not from Xorg.


