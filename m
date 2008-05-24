Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Jzu6z-0005tm-94
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 May 2008 15:48:41 +0200
Received: by an-out-0708.google.com with SMTP id b38so246714ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 May 2008 06:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	bh=1GpcwwCYrWDSCUbvrC2CAtfu60b0GhtKDIsvCgjDBgA=;
	b=GnSl8nxkcXqA+mJSv195Yg8aJaI+z7nECGsctYE+vRrjlX+qEGEzbkoxiPi2yCfI6Y7DNpvJftvdm9RhyWWwIk7X1MHvrRGV+mcAbox0hCs39Mw7CzU1TqQZ0eCVNMyUw75i6tB4W0DcoAgtLYnm3KKXvHELNfbYwinfu1It/cM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=MWCTKlehGU2O5AYlThCJ36xtnXYXwz/2butXvWE5HqKdiA3Hy+oP//U4Q2cvnV3+LfBuYjfzCh5F5mA+Tj0/tle5zdbM4TgL8ZlT0igOvT3IB1V746Cjb65CjNdyjgVvTFMp3h0JQUNlE149v2IghhgV2WE5tsGaCmbT8fR2wVE=
Received: by 10.100.194.5 with SMTP id r5mr3768606anf.146.1211636742581;
	Sat, 24 May 2008 06:45:42 -0700 (PDT)
Received: by 10.100.189.9 with HTTP; Sat, 24 May 2008 06:45:42 -0700 (PDT)
Message-ID: <c384c5ea0805240645n17fb3b70v435a34f491647de4@mail.gmail.com>
Date: Sat, 24 May 2008 15:45:42 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: concurrency issue at hand?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 24 May 2008 13:48:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

during the last few weeks I have run into erroneous builds against
.dev and bitbake head. (80% of all my builds fail).

MACHINE=at32stk1002, DISTRO=angstrom-2008.1, uclibc
MACHINE=mpc8313e-rdb, DISTRO=angstrom-2008.1, both glibc or eglibc

which reproduced, so I have been trying to understand the build errors
at the package level, going back and forth between known-good and
known-bad revisions, etc.

However, building this on different hosts, seeing different behaviour,
 and now with concurrency disabled and enabled, I think we have a
concurrency issue at hand.

Sometimes restarting the build helps, sometimes not.

I strongly suspect threaded bitbakes in combination with packaged-staging.

I just wondered if anyone else is seeing the same?

Regards,
-- 
Leon


