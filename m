Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rpcs0-0000CB-71
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jan 2012 10:40:54 +0100
Received: by lags15 with SMTP id s15so2166612lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2012 01:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=/MweCJb9WT5cSpxkwPZz3vYW8t4oLKDoIHMHMejaOlQ=;
	b=PJAryzsK9QngnxIO47c05+DU8NJibKy8sJL6fiBrYbNpRsyTsSm4SPelR1xg/Q4y4u
	dpA7ss16q0+OPw1n5YSx1xP4UKK3QU7JC/MuYbeTqF94gcmIEXEGNWFYt+Nv2VhkNFH0
	x+NjcYMOjRDpFcfHlSrB78R1D7ucwMOG4/cFU=
MIME-Version: 1.0
Received: by 10.112.23.41 with SMTP id j9mr3079616lbf.35.1327397586932; Tue,
	24 Jan 2012 01:33:06 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Tue, 24 Jan 2012 01:33:06 -0800 (PST)
Date: Tue, 24 Jan 2012 10:33:06 +0100
Message-ID: <CALbNGRQoDcEN3MfyDYCKe94=AgU6vK5rQcE7sWnaHnGyy6C51w@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe 1/3] babl: initial add 0.1.6
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
X-List-Received-Date: Tue, 24 Jan 2012 09:40:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tuesday, January 24, 2012 01:41:51 AM Khem Raj wrote:

> On (23/01/12 08:24), Andreas M=FCller wrote:
> > +FILES_${PN} +=3D "${libdir}/babl-*/*.so"

>

> sometimes .so are symlinks and should really go into -dev packages

> can you double check if thats not the case here ?
I checked for babl/gegl/gimp: All these are files. Anyway: AFAIK there
would be a QA message for *.so symlinks - there are none.

Andreas

