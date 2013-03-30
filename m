Received: from smtp-out21.han.skanova.net ([195.67.226.208])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@emagii.com>) id 1ULx9o-00047V-7X
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Mar 2013 15:53:24 +0100
Received: from [10.175.196.242] (83.227.56.237) by smtp-out21.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 5124CA9E00F8D55C for openembedded-devel@lists.openembedded.org;
	Sat, 30 Mar 2013 15:36:18 +0100
Message-ID: <5156F862.6080005@emagii.com>
Date: Sat, 30 Mar 2013 15:36:18 +0100
From: Ulf Samuelsson <openembedded@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5156DB73.4040507@emagii.com>
	<CAPESJy7cfZvAePoLrVnvqoxaYRRxz1=U5L5ROP5MHbiWZEEBCA@mail.gmail.com>
In-Reply-To: <CAPESJy7cfZvAePoLrVnvqoxaYRRxz1=U5L5ROP5MHbiWZEEBCA@mail.gmail.com>
Subject: Re: Finding out the IMAGE_BASENAME of the image beeing built
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
X-List-Received-Date: Sat, 30 Mar 2013 14:53:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-03-30 14:04, Takeshi Hamasaki wrote:
> Hi Ulf,
>
> $ MACHINE=beagleboard  bitbake -e some-image
>
> shows all variables including $IMAGE_BASENAME without actually
> building the image.
> Using grep you can take the value of IMAGE_BASENAME, like as:

Thanks,

bitbake is already running to build my recipe.
Not sure that running "bitbake -e" is OK while bitbake is already running.

IMAGE_BASENAME is set to my recipe, so I cannot use this directly.

> $ MACHINE=beagleboard  bitbake -e some-image | grep ^IMAGE_BASENAME
>
> Does it help you?
>
> If possible, consider to use hooks, for example, IMAGE_POSTPROCESS_COMMAND .
> Refer image.bbclass for details. It might make things straiter.
>
> Regards,

I know I can do it inside the "some-image.bb" recipe, but I would like
to do it inside my recipe. Otherwise all images must be customized
for my recipe, which is not a good idea.

If I could do an IMAGE_POSTPROCESS_COMMAND in my recipe, then
that would be OK, but I then still need to find out what the image name is.

BR
Ulf Samuelsson



