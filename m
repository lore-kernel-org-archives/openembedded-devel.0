Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RZ3D7-0000i3-Bg
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 17:22:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB9GFHCg022815
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Dec 2011 08:15:17 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 9 Dec 2011 08:15:14 -0800
Message-ID: <4EE23411.2060907@windriver.com>
Date: Fri, 9 Dec 2011 10:15:13 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4EE17931.7000609@googlemail.com>	<CABcZANn76DwH5QPkZw_zPVBHxS0F3a-7YgKebU3Hd=+CtZd+eQ@mail.gmail.com>	<4EE20646.2030300@googlemail.com>
	<jbt2rc$l31$1@dough.gmane.org> <4EE2305B.5030407@googlemail.com>
In-Reply-To: <4EE2305B.5030407@googlemail.com>
Subject: Re: packages versioning
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
X-List-Received-Date: Fri, 09 Dec 2011 16:22:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/9/11 9:59 AM, Mr Dash Four wrote:
>
>>> One more query regarding this - how do I remove
>>> packages I do not want included in the final image? Is there a way to do
>>> that (fairly) easily?
>>>
>>
>> Yes, create your own image recipe.
>>
> I was hoping that there is an easier option ("(fairly) easily" being the
> keywords here)!
>
> I tried to trace where these packages are derived from, but could not
> find anything. For example, I'd like to remove ash (and possibly the
> whole BusyBox setup) and replace it with bash and their package
> equivalents. By looking at the tasks/ as well as images/ directories I
> couldn't find where these packages are derived from, hence the above
> question.

The creation of the filesystem image is driven by a number of components. 
Basically it works like this:

You select an image to build.  The image sets a few flags and a basic set of 
requirements.  The image inherits the core-image.bbclass.

The core-image.bbclass uses the flags, machine settings and extra settings to 
determine a list of actual dependencies.  Most of these dependencies are broken 
into groups.  Some of the groups are individual sets of recipes, while most are 
actually tasks.

The tasks themselves are broken down into functional areas.  These functional 
areas are designed to give you control at a "functional" level, designed to 
assist people who really aren't sure exactly what source packages to start from. 
  If you look for a list of the tasks you can see the breakdown and components.

In the recipes-extended, there is a set of core-tasks.  These tasks allow you to 
build up a system starting with busybox, and slowly add to it and replace 
busybox with the discrete components from util-linux, coreutils, etc.

I have a spreadsheet (OpenOffice 17k, or Excel 81k) that lists all of the 
current breakdowns.  If you are interested send me an email off list.

--Mark


