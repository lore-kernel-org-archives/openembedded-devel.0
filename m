Received: from [213.4.149.66] (helo=ctsmtpout3.frontal.correo)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <joaquinduran@adtelecom.es>) id 1GSE8B-000349-2E
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Sep 2006 16:41:55 +0200
Received: from [194.179.62.31] (217.126.70.245) by ctsmtpout3.frontal.correo
	(7.2.056.6) (authenticated as joaquinduran$adtelecom.es)
	id 4517AC2900039B95 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Sep 2006 16:37:06 +0200
Message-ID: <451948D7.6000904@adtelecom.es>
Date: Tue, 26 Sep 2006 16:35:51 +0100
From: Joaquim Duran <joaquinduran@adtelecom.es>
User-Agent: Mozilla Thunderbird 1.5.0.7 (X11/20060926)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45190D58.2020807@adtelecom.es>
	<1865823264.20060926150138@gmail.com>
In-Reply-To: <1865823264.20060926150138@gmail.com>
Subject: Re: List of dependent packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2006 14:41:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Thanks for your answer. This is closer that I was looking for.

I've tested both options (--dry-run) and (--graphviz).

Using the first one with bootstrap image, the following output has been 
shown (it shown that several packages should be used and I should choose 
one):

OE Build Configuration:
BB_VERSION     = "1.6.1"
OE_REVISION    = "57f56983ed32783fae7cfa0440e1f3a7cfc2280c"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "colibri"
DISTRO         = "colibrioe"
DISTRO_VERSION = "1.0"
TARGET_FPU     = ""

NOTE: multiple providers are available (task-bootstrap-unionroot, 
task-bootstrap);
NOTE: consider defining PREFERRED_PROVIDER_task-bootstrap
NOTE: package bootstrap-image-1.0: started
NOTE: package bootstrap-image-1.0: completed
NOTE: build 200609261620: completed


The simple question is: how can I define 
PREFERRED_PROVIDER_task-bootstrap line the local.conf file?


The execution of the second option has finished with an error of 
bitbake. I'll send the error to bitbake page.


Thanks and Best Regards,
Joaquim Duran



En/na Paul Sokolovsky ha escrit:
> Hello Joaquim,
> 
> Tuesday, September 26, 2006, 2:22:00 PM, you wrote:
> 
>> Dear all,
> 
>> Is there any way to know the set of packages to be included in an
>> image? Or more generally, how can I list the set of packages (with
>> recursion) that are needed for one specified package?
> 
>> This should be done once processed the config file and updated the cache
>> and before the compilation of packages.
> 
>   bitbake --help would the first place to consult. --dry-run,
> --verbose, --graphviz swicthes would be of primary interest. And yes,
> bitbake still doesn't provide enough insight into its internal
> functioning. Patches to improve that (given they cover broad usecases)
> would be welcome by Bitbake maintainers, I guess.
> 
>> Thanks and Best Regards,
>> Joaquim Duran
> 
> 



