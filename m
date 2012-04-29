Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOcl9-00005G-FR
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 00:38:27 +0200
Received: by lbbgo4 with SMTP id go4so1506902lbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 15:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=/QS8kvbO8fIvPahjn5CH2Xygw0S04EKsStOOSHlM6c4=;
	b=T/xVjCVgadSUPe/L08FgBRHHptz+CXUlCAm96KfsLvzcB2P80gTIbICL5t7CkME4an
	qiSgDjnnzoG4qJuTDjoxBHpf4qJAMqKALIjKrXon6Go0bRU67Q/rpOiqB2TJHbCAEUtL
	ofNLqCSl5pxsck/KIV3NIvze4KPKsb/lZPyx7iTS0YmvrWikVE5FWxaqwfGWbuMU3JfU
	kEqXbRs+HnTk9kB1Gv0RoJEOkrOWwena6RhP3mIlhnE72paW7ff16WXlCmBWrMSr1aWi
	CLyj90SEXCZsuGNL1rpBDON2M06DoPLOLh8NgRXUFNn4c8RXDzsnz+pZtkw2pp917do+
	fFRQ==
Received: by 10.112.100.170 with SMTP id ez10mr9302634lbb.15.1335738526205;
	Sun, 29 Apr 2012 15:28:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sun, 29 Apr 2012 15:28:15 -0700 (PDT)
In-Reply-To: <CAL9MRr=VckWCzbq=+t9SJZ9CiLfPcAp4CrYNihUS1cOYc0-NFA@mail.gmail.com>
References: <CAL9MRr=VckWCzbq=+t9SJZ9CiLfPcAp4CrYNihUS1cOYc0-NFA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Apr 2012 15:28:15 -0700
Message-ID: <CAMKF1somCnr2JHQ_x0om2iyVo=D7jhLmUQ4+e-09xETP8NpHhA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sun, 29 Apr 2012 22:38:27 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 24, 2012 at 3:24 AM, Nicu Pavel <npavel@mini-box.com> wrote:
> Hi,
>
> What's the proper way of adding a new board support layer ? Should I
> just add a meta-picosam9 with our kernel recipes and board
> configuration and submit a patch ?

It seems you are interested in layered model which means you will
base your work on oe-core and other layers. Yes writing your own
machine layer is a preferred approach. However you need to host
and maintain the layer. For hosting gihub bitbucket gitorious etc
work good. If you maintain the layer in pretty good shape many
distro's like angstrom might include your machine layer in the
default build

There are some machine layers mentioned here

 http://www.openembedded.org/wiki/LayerIndex

You can use one of those for reference and modelling its upto you

>
> Thanks,
> Nicu Pavel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


