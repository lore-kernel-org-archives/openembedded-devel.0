Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RvQeW-0001gd-Rs
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 10:50:56 +0100
Received: by vcbfl15 with SMTP id fl15so394350vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 01:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Zd4mhTy8FJcNS/cmVpyYOOPrhg4q0uzxX7Q5hy9KOrI=;
	b=kxXt69OgR2NSP2xQRXk7ee8vsn4FthzHBrj40SL2YcAgafyYSquK3pTc5iXCgSDXpd
	xdGZ/3HQqHFkt+qDmST8ppYFf4xUAbaSx2ZyVqtsOFOpIWRI3J4F5DNuLhzzFyRoHfrH
	KDGzmVDSd/XRqbrgcH8DwN/UIPGBCb0CdmjhM=
MIME-Version: 1.0
Received: by 10.220.149.212 with SMTP id u20mr470636vcv.7.1328780571907; Thu,
	09 Feb 2012 01:42:51 -0800 (PST)
Received: by 10.52.27.97 with HTTP; Thu, 9 Feb 2012 01:42:51 -0800 (PST)
In-Reply-To: <4F338B5A.2070106@gherzan.ro>
References: <4F33048E.8030109@palm.com>
	<4F338B5A.2070106@gherzan.ro>
Date: Thu, 9 Feb 2012 10:42:51 +0100
Message-ID: <CACW_hTZkPFOYzvyGLB+5p+FQPUk+CzUd+Mmbui+1T+4S8-jY7Q@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake versions
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
X-List-Received-Date: Thu, 09 Feb 2012 09:50:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

2012/2/9 Andrei Gherzan <andrei@gherzan.ro>:
> On 02/09/2012 01:26 AM, Rich Pixley wrote:
>>
>> I'm having trouble even parsing using bitbake > 1.12.
>>
>> Am I right in thinking that the openembedded tree isn't ready to be built
>> with bitbake > 1.12?
>>
>> If so, then the getting started document should probably include this
>> info.
>
> I just finished a core-image-minimal + some other packages using bitbake
> form git, branch master. So i don't think that there a problem with bitbake
> in your case. What error you encountered? What is your system shell? Hope
> bash.
>
> @g
>
>

If one is using oe-classic then bitbakes > 1.12 indeed introduce issues.
One that I recall is that it gives a warning if there is a # in a
variable (e.g. when commenting out a patch in a recipe).
But there were other ones too actually blocking it.

If you are using oe-classic better stay with 1.12.
For oe-core probably the latest version of bitbake is the best choice.

Frans


