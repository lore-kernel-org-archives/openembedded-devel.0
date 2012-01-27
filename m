Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RqakX-0002Ga-1v
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Jan 2012 02:37:09 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Jan 2012 17:28:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="103200632"
Received: from unknown (HELO [10.255.14.96]) ([10.255.14.96])
	by orsmga002.jf.intel.com with ESMTP; 26 Jan 2012 17:28:04 -0800
Message-ID: <4F21FDA2.5070803@linux.intel.com>
Date: Thu, 26 Jan 2012 17:28:02 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CALbNGRS-WsE45UakTV5VE2T5bAxb1C2iWgPeN+Ys+OTx-i48Rw@mail.gmail.com>
In-Reply-To: <CALbNGRS-WsE45UakTV5VE2T5bAxb1C2iWgPeN+Ys+OTx-i48Rw@mail.gmail.com>
Subject: Re: evince: who is responsible to pack all within usr/lib/evince/3/backends to ${PN}?
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
X-List-Received-Date: Fri, 27 Jan 2012 01:37:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 01/26/2012 05:16 PM, Andreas Müller wrote:
> Since the staticdev update of insane.bbclass in oe-core I get
>
> WARNING: QA Issue: non -staticdev package contains static .a library:
> evince path '/work/armv7a-angstrom-linux-gnueabi/evince-2.32.0-r1/packages-split/evince/usr/lib/evince/3/backends/libtiffdocument.a'
> WARNING: QA Issue: non -staticdev package contains static .a library:
> evince path '/work/armv7a-angstrom-linux-gnueabi/evince-2.32.0-r1/packages-split/evince/usr/lib/evince/3/backends/libpixbufdocument.a'
> WARNING: QA Issue: non -staticdev package contains static .a library:
> evince path '/work/armv7a-angstrom-linux-gnueabi/evince-2.32.0-r1/packages-split/evince/usr/lib/evince/3/backends/libcomicsdocument.a'
> WARNING: QA Issue: non -staticdev package contains static .a library:
> evince path '/work/armv7a-angstrom-linux-gnueabi/evince-2.32.0-r1/packages-split/evince/usr/lib/evince/3/backends/libpdfdocument.a'
>
> I checked: the complete contents of /usr/lib/evince/3/backends go to
> evince package and I would like to move *.a to ${PN}-staticdev and
> *.la to ${PN}-dev but I don't understand: who is responsible for
> adding all this to ${PN}?
>
bitbake.conf defines where most files should go, but when you get files 
in sub-directories, such as /usr/lib/evince/..., then the recipe needs 
to do a little more work. If you look at the evince_2.32.0.bb, there 
already is a FILES_${PN}-staticdev that adds some extensions, you need 
to add this set of backends to that list, probably same with the .la to 
the -dev package.

Sau!

> Regards
>
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


