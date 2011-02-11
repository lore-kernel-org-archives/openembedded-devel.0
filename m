Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Po1P5-0004Hb-Qo
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 23:23:51 +0100
Received: by wyb40 with SMTP id 40so2884606wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 14:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=8mv4Dh5HVgvcMcijZeIEKfua03Qm5Ujpi2IYuWFbQT8=;
	b=YPsWBZC3ThqN4v2GOFsNfM7XMDkKHHO59kUajJ2nomAWNqPX47Wy0OS/56Vba8Bdxi
	F7upqm9X86HtHKOXTsmNxR++xRDv3h8EpvULDQgzVW2lU9X0ipL243hBljHWTTJW9wfg
	n2bgHOKm4oCjCSgdatvI8kEHrBJiWvk3vbSqk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=pIGZhUwQaNAA0L+ulJnJFwAE1l8EJf2vOLcW8vUv9YuuMfA0MH5+eIJRxjfze5+15A
	LGleCgyV+GVRaNjGxJPwIWHZpnM7XcvfnKwWldhnvTEUMg8+M88LBL3SlAnvLfhA4jY0
	ZtomeZ3hFu5GRHzCQrHtXlsbhZNyhoY8gnn70=
Received: by 10.216.169.202 with SMTP id n52mr1243896wel.15.1297462965872;
	Fri, 11 Feb 2011 14:22:45 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.17.11 with HTTP; Fri, 11 Feb 2011 14:22:25 -0800 (PST)
In-Reply-To: <1297428703-2330-1-git-send-email-obi@opendreambox.org>
References: <1297428703-2330-1-git-send-email-obi@opendreambox.org>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 11 Feb 2011 15:22:25 -0700
X-Google-Sender-Auth: PhiiXEhxP6ZQpT0uB9zFp-qjUTM
Message-ID: <AANLkTi=yDi-TRMa7kR7vmkwoEa-u+W7_w6ECwmkRRaPf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/4] utils.bbclass: restore previous implementation of explode_deps()
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
X-List-Received-Date: Fri, 11 Feb 2011 22:23:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2011 at 5:51 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> * explode_deps() changed its behavior to omit version information
> =C2=A0when the function was removed from OE in favor of BitBake's
> =C2=A0implementation in March 2010. Since then, packages didn't contain
> =C2=A0versioned runtime dependencies.
>
> =C2=A0See commit 89b7e433719f43f1c36c76cb8856d559014e99bc
>
> * This patch restores the previous implementation of explode_deps(),
> =C2=A0thus fixing the generation of versioned runtime dependencies.
>
> * Reimplementing explode_deps() using bb.utils.explode_dep_versions()
> =C2=A0didn't work, because it choked upon parsing inline python code, e.g=
.
> =C2=A0on update-modules_1.0.bb
>
> 's RDEPENDS_${PN} field.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> CC: Chris Larson <chris_larson@mentor.com>

Acked-by: Chris Larson <chris_larson@mentor.com>

--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


