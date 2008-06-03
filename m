Received: from [209.85.128.191] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthijs.van.de.water@gmail.com>) id 1K3QpP-0004OJ-2h
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Jun 2008 09:21:08 +0200
Received: by fk-out-0910.google.com with SMTP id 19so1332011fkr.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jun 2008 00:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=tZMyEMhiZxNTqdrfK2OgIUAtpCpJD2LaPUGft8RmM0E=;
	b=Bh8YWaQi0hoTJYAFzX1s/yVkHN4V+7TOXbvx891QJv6TDhlTUc/uC0Nn0jwOIwRrSVbZUyVIB+40fjK148Dq8UAo68fThTCurYL6wbLyNovAdZ3X+Y0k0D2cLJoa7OlFID2I+Qjvg2G2ih8AkmSMcf0rAO/qexVvbBElh8QPITc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=xpW95sJVxaf+SZI4BZD3vM/j73uXnzKefhare3LDS5SQqThnHQtRh9JSls+rl6HR3UkPQ3hSdIfm+++5mT6jcKO1xWjt9AeXAh5txZbUbyTLMyECHwY8IYEwUnd1A2xINq1wqlycPsW+tNZidEJyGmGJpDg8KA3x7RFelKYffnw=
Received: by 10.78.144.11 with SMTP id r11mr744396hud.78.1212477405748;
	Tue, 03 Jun 2008 00:16:45 -0700 (PDT)
Received: by 10.78.160.4 with HTTP; Tue, 3 Jun 2008 00:16:45 -0700 (PDT)
Message-ID: <35a670560806030016y4fab1071pd7843d2736b32943@mail.gmail.com>
Date: Tue, 3 Jun 2008 09:16:45 +0200
From: "Matthijs van de Water" <matthijs.van.de.water@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g1jf9e$ltq$1@ger.gmane.org>
MIME-Version: 1.0
References: <70c9a9110805220710x6663f582lc5d6b75744960d08@mail.gmail.com>
	<70c9a9110805220711i33fd397k518855a05773edf0@mail.gmail.com>
	<1211958108.27777.15.camel@isis>
	<35a670560805280252o3fc348d1x7b7cf51b01f209e9@mail.gmail.com>
	<g1jf9e$ltq$1@ger.gmane.org>
Subject: Re: GCC 4.3 fails to build glibc(-intermediate)
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
X-List-Received-Date: Tue, 03 Jun 2008 07:21:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Did anyone working with GCC 4.3 have any problems with the C++
compiler in the SDK?

With the current setup, my include path search order is such that for
instance the <cstdlib> header is trying to #include_next<stdlib.h>,
which fails because the normal include paths precede the C++ include
paths.
If I change the #include_next to #include the headers work fine, but
that is obviously no solution. It looks like this is broken for all
sysroot builds, because the compiler will put the sysroot include
before the C++ ones and get rid of any duplicates.

Did anyone see this before? Any suggestions? I think I can solve this
by changing back to --enable-cheaders=c_std instead of c_global (which
was the default previously and which is why pre-4.3 toolchains work
fine for me), but I'm not sure of the implications of that.

Regards,

Matthijs

--enable-cheaders=OPTION

    This allows the user to define the approach taken for C header
compatibility with C++. Options are c, c_std, and c_global. These
correspond to the source directory's include/c, include/c_std, and
include/c_global, and may also include include/c_compatibility. The
default is c_global.


