Received: from [128.178.224.226] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1LDb0f-0006ZJ-9r
	for openembedded-devel@openembedded.org; Fri, 19 Dec 2008 09:47:01 +0100
Received: (qmail 6929 invoked by uid 107); 19 Dec 2008 08:42:20 -0000
Received: from mailav1.epfl.ch (128.178.50.190)
	by smtp3.epfl.ch with SMTP; 19 Dec 2008 08:42:20 -0000
Received: from (unknown [128.178.224.219]) by mailav1.epfl.ch with smtp
	id 59ee_f2889f76_cda8_11dd_847a_001143d18479;
	Fri, 19 Dec 2008 09:42:19 +0100
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Fri, 19 Dec 2008 09:42:20 +0100
Message-ID: <494B5E6C.9020609@epfl.ch>
Date: Fri, 19 Dec 2008 09:42:20 +0100
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.18 (X11/20081125)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <20081218161337.32EA0189349@amethyst.openembedded.net>
	<494A8809.502@gmx.net>
In-Reply-To: <494A8809.502@gmx.net>
Cc: John Lee <john_lee@openmoko.com>
Subject: Re: [oe-commits] John Lee : om-gta02.conf: bring over this conf from om.dev
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
X-List-Received-Date: Fri, 19 Dec 2008 08:47:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Robert Schuster wrote:
> GIT User account schrieb:
>>  TARGET_ARCH = "arm"
>> -MACHINE_CLASS = "neo1973"
>> -PACKAGE_EXTRA_ARCHS = "fic-gta02 ${MACHINE_CLASS}"
>> +PACKAGE_EXTRA_ARCHS = "armv4t"
> Something may be missing. When the change is applied I cannot build
> anything because I get an error from the sanity checker:
> 
> ERROR:  Openembedded's config sanity checker detected a potential
> misconfiguration.
> 	Either fix the cause of this error or at your own risk disable the
> checker (see sanity.conf).
> 	Following is the list of potential problems / advisories:
> 
> 	Error, Your PACKAGE_ARCHS field contains duplicates. Perhaps you set
> EXTRA_PACKAGE_ARCHS twice accidently through some tune file?
> 

I don't know where this git change comes from, but for me it looks 
wrong, it looks like a commit going _backwards_. The error you get is 
because PACKAGE_ARCHS contains duplicates, and this comes from the 
PACKAGE_EXTRA_ARCHS that is set in the above patch. You cannot have 
duplicates in the PACKAGE_ARCHS variable. Here you certainly have armv4t 
twice !

I think that now PACKAGE_EXTRA_ARCHS variables no longer are define in 
conf/machine/files but in conf/machiine/include/tune-proc files.

Val

-- 
Valentin Longchamp, PhD Student, EPFL-STI-LSRO1
valentin.longchamp@epfl.ch, Phone: +41216937827
http://people.epfl.ch/valentin.longchamp
MEA3485, Station 9, CH-1015 Lausanne


