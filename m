Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1M6hwF-0004NN-QO
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 11:18:16 +0200
Received: by ewy20 with SMTP id 20so376953ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 02:10:46 -0700 (PDT)
Received: by 10.210.116.14 with SMTP id o14mr3651349ebc.54.1242810646716;
	Wed, 20 May 2009 02:10:46 -0700 (PDT)
Received: from xora-eee.xora-domain (93-97-174-2.zone5.bethere.co.uk
	[93.97.174.2])
	by mx.google.com with ESMTPS id 5sm1764092eyh.40.2009.05.20.02.10.44
	(version=SSLv3 cipher=RC4-MD5); Wed, 20 May 2009 02:10:45 -0700 (PDT)
Message-ID: <4A13C909.5030103@xora.org.uk>
Date: Wed, 20 May 2009 10:10:33 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1b3pre) Gecko/20090513 Fedora/3.0-2.3.beta2.fc11
	Thunderbird/3.0b2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090520002850.71F7F1880A4@amethyst.openembedded.net>
In-Reply-To: <20090520002850.71F7F1880A4@amethyst.openembedded.net>
Subject: Re: [oe-commits] Angus Ainslie : paroli-elementary : set SRCPV
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
X-List-Received-Date: Wed, 20 May 2009 09:18:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/20/2009 01:28 AM, GIT User account wrote:
> Module: openembedded.git
> Branch: fso/milestone5.5
> Commit: 11eb31d33cd40eb91bbe3033b622e7a4e8d3f4a3
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=11eb31d33cd40eb91bbe3033b622e7a4e8d3f4a3
>
> Author: Angus Ainslie<nytowl@openmoko.org>
> Date:   Tue May 19 18:28:02 2009 -0600
>
> paroli-elementary : set SRCPV
>
> ---
>
>   recipes/openmoko-projects/paroli-elementary_git.bb |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/openmoko-projects/paroli-elementary_git.bb b/recipes/openmoko-projects/paroli-elementary_git.bb
> index f9cf3a4..305302d 100644
> --- a/recipes/openmoko-projects/paroli-elementary_git.bb
> +++ b/recipes/openmoko-projects/paroli-elementary_git.bb
> @@ -1,10 +1,10 @@
>   DESCRIPTION = "python-elementary paroli bindings"
>   DEPENDS = "python-cython-native python-pyrex-native python-numeric eina elementary"
>   RDEPENDS = "python-lang python-evas python-ecore python-edje"
> -PV = "0.1+gitr${SRCREV}"
> -PR = "r0"
> +PV = "0.1+gitr${SRCPV}"
> +PR = "r1"
>
> -inherit distutils
> +inherit setuptools
>
>   SRC_URI = "git://git.paroli-project.org/python-elementary.git;protocol=http"
>
>    
I know this is your branch so you can do what you like, but this wont 
actually work unless you increment the PE of the recipe as well because 
git?+??????? can possibly sort lower than the random hash.

Graeme



