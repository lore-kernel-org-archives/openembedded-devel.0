Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <npavel@mini-box.com>) id 1SPApn-0000e6-7k
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2012 13:01:31 +0200
Received: by iakk32 with SMTP id k32so5703096iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 May 2012 03:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=ODEhSmNCXWwsOqsat/yLrRqPRxEwV9KSx/39Z0pu2wQ=;
	b=pcNKoY3x35+egirQ1VQ8ME93Bf13lGvmgoe/BAWsjxlAzALai+VX+qVHY1kpQ+aWpy
	HBQB0KtKlGNqVrDrJtBi3EqKeJagi3y8EndVPrzrg/GjlWfAVcRDaug8hjOE3EIIJQc4
	R6nDxR9Ojymq55LA2Pu6WiE1bHcs5iCUyq21WzQqluRTTarG/eP6uWtvOgQ3dG6/fw1L
	JkkBI7kMMES/wnzuVy1+1aasGd/mjS3+nqftrEN86uTK0dJIVaNhUY68HZiDXiGgeGIU
	C/bwBBZyI7mshSUreofOnEu57X7Gx/lbokN/c17wTiA+52o2ktDQaF66QW3TBicZPbii
	O9Xg==
MIME-Version: 1.0
Received: by 10.50.194.163 with SMTP id hx3mr1153049igc.49.1335869504986; Tue,
	01 May 2012 03:51:44 -0700 (PDT)
Received: by 10.64.55.197 with HTTP; Tue, 1 May 2012 03:51:44 -0700 (PDT)
In-Reply-To: <CAMKF1somCnr2JHQ_x0om2iyVo=D7jhLmUQ4+e-09xETP8NpHhA@mail.gmail.com>
References: <CAL9MRr=VckWCzbq=+t9SJZ9CiLfPcAp4CrYNihUS1cOYc0-NFA@mail.gmail.com>
	<CAMKF1somCnr2JHQ_x0om2iyVo=D7jhLmUQ4+e-09xETP8NpHhA@mail.gmail.com>
Date: Tue, 1 May 2012 13:51:44 +0300
Message-ID: <CAL9MRr=-Kfh_avCagGVvi1jUE4URAHnEedca0gZ3G=7eN+XtPQ@mail.gmail.com>
From: Nicu Pavel <npavel@mini-box.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlr+S9pEoN0+EvutInucJDILfnEks98UXFfs0VbNT7ygXoVlIkaaiFE7Jq9iMr0khAXlhuP
Subject: Re: Adding a board support layer.
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
X-List-Received-Date: Tue, 01 May 2012 11:01:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 30, 2012 at 1:28 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Apr 24, 2012 at 3:24 AM, Nicu Pavel <npavel@mini-box.com> wrote:
>> Hi,
>>
>> What's the proper way of adding a new board support layer ? Should I
>> just add a meta-picosam9 with our kernel recipes and board
>> configuration and submit a patch ?
>
> It seems you are interested in layered model which means you will
> base your work on oe-core and other layers. Yes writing your own
> machine layer is a preferred approach. However you need to host
> and maintain the layer. For hosting gihub bitbucket gitorious etc
> work good. If you maintain the layer in pretty good shape many
> distro's like angstrom might include your machine layer in the
> default build
>
> There are some machine layers mentioned here
>
> =A0http://www.openembedded.org/wiki/LayerIndex
>
> You can use one of those for reference and modelling its upto you

Thanks for the info, I added a layer for our board here:

git://gitorious.org/picopc-tools/meta-picosam9.git

I successfully build kernel and console-image from meta-angstrom layer with=
 it.

Thanks,
Nicu Pavel


