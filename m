Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PTxxJ-000705-MJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 15:40:17 +0100
Received: by iyj18 with SMTP id 18so1163772iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 06:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=OtQ9t/CBo9ptyzF2NV4RDIulEzPMDQ95VwXNkq6oOf4=;
	b=XormxIytEZ8s7pja1OvIRitcPz4Mut7is2DOkkZad+Y1lznX+zqhJ+AxHA2Jbhtb/S
	4eK11dk4+5rpOAqeK+aQs/I/sl9Ixeg6xw2eIJwwFAU+LPSCh8nPcHHVRY7WCpK/3Rr/
	hnzyIqfnIhnTv/YycCLdlQDoF+dfii/ZTIW3g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GngsKcV/GIRVreQtPMkzrAx6cDOOSQL8rB4AwGWtMz+B9htHmGWDFHRjsstd4utmCp
	oHvlY8RbPtUgJSqjmhoyATkpsg847yYV0b+so1wINuLowMX/qVUIUE6IIziK6vu2WMiI
	fkD0VDyZ9dLT7DZ9WL/1y+tSrvAVz5/Yqnebw=
MIME-Version: 1.0
Received: by 10.231.38.10 with SMTP id z10mr1984068ibd.107.1292683212816; Sat,
	18 Dec 2010 06:40:12 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Sat, 18 Dec 2010 06:40:12 -0800 (PST)
In-Reply-To: <AANLkTinBWptJBBgLtsae9_80CdxwWTEP-L-hiCFzFWLC@mail.gmail.com>
References: <AANLkTim1ZFrjZuvJgKGB-+2wTNUAx5cdiNsRXK8bvRf9@mail.gmail.com>
	<AANLkTikT2Y14XM+-iKGpesPDfX4KDMz5B=4z7PCKXSya@mail.gmail.com>
	<AANLkTi=ptFSTuWbvkEAg+5EsLgyeBzWsrPYvr5TLf=PR@mail.gmail.com>
	<AANLkTinBWptJBBgLtsae9_80CdxwWTEP-L-hiCFzFWLC@mail.gmail.com>
Date: Sat, 18 Dec 2010 15:40:12 +0100
Message-ID: <AANLkTimhOoG9Euq06jBibbBdbF7TPjcSxOg-xcf-fra+@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, bitbake-dev@lists.berlios.de
Subject: Re: bitbake git head issue
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
X-List-Received-Date: Sat, 18 Dec 2010 14:40:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

I did some more analysis on this by popping commits.

THis commit

commit 416dfe211ff0c37d746efe113bb6064b7e57d43a
Author: Chris Larson <chris_larson@mentor.com>
Date:   Fri Dec 10 10:37:11 2010 -0700

    server: kill stdin/stdout/stderr

    This ensures that nothing run from the server can touch the console, in
    particular event handlers and python tasks, both of which can use bb.msg or
    the bitbake loggers to send output to the UI in a correct fashion instead.


Seems to be the bad guy. If I reset until this commit,  I get the error.
If I then drop one more commit (git reset --hard HEAD^) the problem is gone.

Frans


