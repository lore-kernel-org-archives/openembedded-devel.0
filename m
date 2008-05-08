Received: from [209.85.146.178] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Ju4uK-0001Jr-94
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 May 2008 14:07:32 +0200
Received: by wa-out-1112.google.com with SMTP id j37so1240374waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 May 2008 05:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=tN5f/W3NFlshkCmSNCK1py4XVTUN2SlH5QOgZKWazVo=;
	b=EKXMydnDpm4DZtQ+5VeJ4u5RUDCGKeUHyDViSRWox0eZiAlOc9jmX+3JlBFfFBoe32ikuqB/mQacZ4rG9Zi39EZGqqXprW9QpbLxurkGRv2WgO7s/92RUuIJvMAtSoc3O3Rkcfe1ofJUiOKHAAqPuKMrs02mjqc7JseHftbvvwA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=IxxplXsg+RN7P5RBNatTrbfPC0xz95sa1l95kLliaK2DSif+RvMcjL3YGbcNp5aRjuYT/TXurzx/ulMYs7fB9NmCn0se/w1Yg6hpKR+cc5K5p+4LLzPJSS3HHsmxWpa+/lJVSTfl8KDcMhuqaeTKGOiHDri0OmKe6CHrnlYEWSI=
Received: by 10.114.58.6 with SMTP id g6mr2977747waa.68.1210248409487;
	Thu, 08 May 2008 05:06:49 -0700 (PDT)
Received: by 10.114.190.2 with HTTP; Thu, 8 May 2008 05:06:49 -0700 (PDT)
Message-ID: <f96d234e0805080506t458743b8g7ea65ab4dcb15525@mail.gmail.com>
Date: Thu, 8 May 2008 08:06:49 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200805080215.23729.zecke@selfish.org>
MIME-Version: 1.0
References: <200805080215.23729.zecke@selfish.org>
Cc: bitbake-dev@lists.berlios.de
Subject: Re: Creating a pristine environment?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 08 May 2008 12:07:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, May 7, 2008 at 8:15 PM, Holger Freyther <zecke@selfish.org> wrote:
> Hey,
>
>  I have seen raster's environment breaking various buildsystems and we might
>  want to really start having a clean environment before starting to build.
>
>  the patch below should implement it. Should we do this in OE? I'm aware of the
>  unexport inside OE but we really should do this the otherway around.

I currently use a few other env variables in my builds to make things
a little more convenient:
export OEDIR="/build/myproject/oe"
export TOPDIR="${OEDIR}/build/angstrom-2007.1"
export BBPATH="${OEDIR}/oe/custom:${TOPDIR}:${OEDIR}/oe/org.openembedded.dev"
export PATH="${OEDIR}/bitbake/bin:${PATH}"

and then in site.conf:
DL_DIR = "${OEDIR}/downloads"

BBFILES := "${OEDIR}/oe/org.openembedded.dev/packages/*/*.bb
${OEDIR}/oe/custom/packages/*/*.bb"
BBFILE_COLLECTIONS = "upstream custom"
BBFILE_PATTERN_upstream = "^${OEDIR}/oe/org.openembedded.dev/packages/"
BBFILE_PATTERN_custom = "^${OEDIR}/oe/custom/packages"
BBFILE_PRIORITY_upstream = "5"
BBFILE_PRIORITY_custom = "10"

So, I would like OEDIR and TOPDIR included in the "good" list :-)

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


