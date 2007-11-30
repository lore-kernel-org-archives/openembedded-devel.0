Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <kergoth@gmail.com>) id 1Iy9GO-0001Qs-An
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2007 18:02:53 +0100
Received: by py-out-1112.google.com with SMTP id a25so5222657pyi
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2007 08:59:43 -0800 (PST)
Received: by 10.142.84.3 with SMTP id h3mr395451wfb.1196441981204;
	Fri, 30 Nov 2007 08:59:41 -0800 (PST)
Received: by 10.142.104.18 with HTTP; Fri, 30 Nov 2007 08:59:41 -0800 (PST)
Message-ID: <b6ebd0a50711300859l392f9b43i8168d2377fb8c852@mail.gmail.com>
Date: Fri, 30 Nov 2007 09:59:41 -0700
From: "Chris Larson" <clarson@kergoth.com>
Sender: kergoth@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <474FF886.7060308@whitby.id.au>
MIME-Version: 1.0
References: <474EA852.7090306@whitby.id.au>
	<474ECF9A.6050603@student.utwente.nl>
	<b6ebd0a50711290902te78ad84hd8cf64829a66c95@mail.gmail.com>
	<474FF886.7060308@whitby.id.au>
X-Google-Sender-Auth: 63135c6f922f07ef
Subject: Re: RFC: auto eth0 and auto eth1 in netbase
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
X-List-Received-Date: Fri, 30 Nov 2007 17:02:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 30, 2007 4:48 AM, Rod Whitby <rod@whitby.id.au> wrote:
> Chris Larson wrote:
> > Afaik, the execution of the hotplug/coldplug scripts on startup should
> > generate the hotplug events for the ethernet interfaces and bring them
> > up that way.  In debian, the hotplug scripts bring them up with ifup
> > --allow=hotplug [iface], such that you need an 'allow-hotplug eth0' in
> > interfaces to have them brought up that way.  I'm too rusty with OE to
> > say how we do it today, but it's not likely that auto is needed.
>
> Unfortunately, the busybox ifup applet does not support the
> allow-hotplug keyword.
>
> Based on the feedback, I'll add 'auto eth0'.

Network interfaces should still be brought up when hotplugged.
Lacking the keyword just means there's no way to prevent it from
happening via interfaces(5).
-- 
Chris Larson - clarson at kergoth dot com
Dedicated Engineer - MontaVista - clarson at mvista dot com
Core Developer/Architect - TSLib, BitBake, OpenEmbedded, OpenZaurus


