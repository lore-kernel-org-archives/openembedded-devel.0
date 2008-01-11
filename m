Received: from [209.85.146.179] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <theqmann@gmail.com>) id 1JDROc-0001XL-ME
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2008 22:26:35 +0100
Received: by wa-out-1112.google.com with SMTP id l24so2154809waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2008 13:26:19 -0800 (PST)
Received: by 10.115.107.1 with SMTP id j1mr4165302wam.55.1200085062542;
	Fri, 11 Jan 2008 12:57:42 -0800 (PST)
Received: by 10.114.47.16 with HTTP; Fri, 11 Jan 2008 12:57:42 -0800 (PST)
Message-ID: <c67f1650801111257g286daeb5xfdec6550eca69dc6@mail.gmail.com>
Date: Fri, 11 Jan 2008 12:57:42 -0800
From: QMan <theqmann@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: mtn disapprove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2008 21:26:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

While we're on the subject of the collie machine stuff, we need to make sure
the tune-strongarm.inc that collie calls doesn't use the -mtune=xscale, as
is the current case, and instead use -mtune=strongarm1100 (not collie) or
-mtune=strongarm1110 (collie).  Also, the collie installkit script should
make "zImage" not "zImage.bin"

-John

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> Of Rolf Leggewie
> Sent: Friday, January 11, 2008 8:54 AM
> To: openembedded-devel@openembedded.org
> Subject: Re: [oe] mtn disapprove
>
> Koen Kooi schrieb:
> > It's the thing I had in mind, but never worked up the motivation of
> > doing :)
>
> OK, here it is: http://oz.leggewie.org/wip/machine-config.diff
>
> * drop unused poodle-2.6.inc
> * work contents of collie-2.6.inc into collie.conf
> * require zaurus-2.6.inc for collie.conf
> * deleted entries from collie.conf that seem superfluous
> * made some changes to zaurus-2.6.inc to make sure it applies
>   to all Zaurus models
> * define SERIAL_CONSOLE in zaurus-2.6.inc as ?=
>
> RP and hrw have given their OK.  I have locally committed it as
> 49cb87ce3fb4d9857d853d9e54f38fa88e9ccc85.  If there are no objections,
> I will eventually push it.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

