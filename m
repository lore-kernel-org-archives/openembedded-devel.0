Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1T1EFX-0006TV-SE
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 12:21:24 +0200
Received: by yhjj56 with SMTP id j56so225860yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2012 03:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=nS8betyAx45gdhqOHGZPGMqbordPVyf/+JWIy6xYhbw=;
	b=d4LlsqxCofNVLs1/Ulu853Z6H+w33dkQWjcrPK+q9k1onJEw4R7KUtQHd0BckzZX9c
	2JU3Przq8tAnsgBH/XQRjugKz9LzKFipKy+CQQ9TBC+eQrTkMobpVq2Nv+ha4rlJhRMX
	KmB6qD+hgeVIiPmSE9mLBOOzToD4vwDNXGD8gZtTuOA8/MQShsmooL+9iawugy813NFU
	2Qv8Rke61ILtymrXUj+uglRZjIOrxZqyrtnGsd8g+89tHRvkE302iHDGZg/Jmlf07+I/
	5S+/ljjnCc8jmwopfYFomijP8wDF4VMP2zhoY7UYMyx/5uDsNcHiVMzpAiN4i1lh6J8n
	IRKw==
Received: by 10.66.86.201 with SMTP id r9mr17986649paz.16.1344938968566;
	Tue, 14 Aug 2012 03:09:28 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id sz3sm423094pbc.21.2012.08.14.03.09.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Aug 2012 03:09:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <k0d7ai$odu$1@dough.gmane.org>
Date: Tue, 14 Aug 2012 14:08:53 +0400
Message-Id: <11ACFBF2-567C-4A7C-85B8-620806B8DF07@gmail.com>
References: <B39AAE57-63B2-4EFA-A037-4F225E1CB21B@gmail.com>
	<k0d7ai$odu$1@dough.gmane.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1278)
Subject: Re: [meta-openembedded/toolchain-layer] Adding retired toolchain support for gcc-4.5.1 and eglibc-2.13
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
X-List-Received-Date: Tue, 14 Aug 2012 10:21:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

On Aug 14, 2012, at 1:55 PM, Koen Kooi wrote:

> Op 13-08-12 22:28, Elvis Dowson schreef:
>> Hi, I've created a set of patches to add retired toolchain support =
for=20
>> gcc-4.5.1, to the meta-openembedded/toolchain-layer.
>=20
> Given that  4.5.x was deleted from meta-toolchain 3 months ago[1], =
what's
> the rationale for adding it back? It's still available in the denzil =
branch,
> so unless someone steps up to maintain it I'm inclined to say "no" to
> patches bringing it back in the master branch.

The gcc-4.5 recipe was adapted from the gcc-4.5.1 recipe from the denzil =
branch.

The structure of the newer gcc-4.7 recipes in the current poky/master =
branch are
a bit different from the older recipes in the denzil branch. So, while =
developing
the gcc-4.5 recipes, I started with the existing gcc-4.7 templates, and =
looked at the
gcc-4.6 recipes in the current meta-openembedded/toolchain-layer and=20
incorporated all the patches for gcc-4.5.1 from the denzil branch. This =
way the
gcc-4.5 recipe would be compatible with builds against the current =
poky/master
branch, and take advantage of all the newer recipe versions, in the =
current
poky/master branch, while maintaining legacy support for the gcc-4.5.1 =
toolchain.

The problem I ran into was with support for soft-float on the PowerPC440 =
processor.

If I can isolate the issue, and get it to work with gcc-4.6 or gcc-4.7, =
there is no need
to add legacy gcc-4.5 toolchain support to the toolchain-layer.

If not, then it would be required to maintain support, atleast for =
PowerPC 440 targets
with soft-float.

Best regards,

Elvis Dowson=


