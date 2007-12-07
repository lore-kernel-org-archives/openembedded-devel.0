Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <raj.khem@gmail.com>) id 1J0j6B-0008Qm-B8
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Dec 2007 20:42:59 +0100
Received: by wa-out-1112.google.com with SMTP id l24so1790054waf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Dec 2007 11:39:07 -0800 (PST)
Received: by 10.114.37.1 with SMTP id k1mr3653404wak.1197056347493;
	Fri, 07 Dec 2007 11:39:07 -0800 (PST)
Received: by 10.114.208.4 with HTTP; Fri, 7 Dec 2007 11:39:07 -0800 (PST)
Message-ID: <19c1b8a90712071139w299bab68k8005b8cc8d1116da@mail.gmail.com>
Date: Fri, 7 Dec 2007 11:39:07 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b6ebd0a50711300859l392f9b43i8168d2377fb8c852@mail.gmail.com>
MIME-Version: 1.0
References: <474EA852.7090306@whitby.id.au>
	<474ECF9A.6050603@student.utwente.nl>
	<b6ebd0a50711290902te78ad84hd8cf64829a66c95@mail.gmail.com>
	<474FF886.7060308@whitby.id.au>
	<b6ebd0a50711300859l392f9b43i8168d2377fb8c852@mail.gmail.com>
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
X-List-Received-Date: Fri, 07 Dec 2007 19:42:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 30, 2007 8:59 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Nov 30, 2007 4:48 AM, Rod Whitby <rod@whitby.id.au> wrote:
> > Chris Larson wrote:
> > > Afaik, the execution of the hotplug/coldplug scripts on startup should
> > > generate the hotplug events for the ethernet interfaces and bring them
> > > up that way.  In debian, the hotplug scripts bring them up with ifup
> > > --allow=hotplug [iface], such that you need an 'allow-hotplug eth0' in
> > > interfaces to have them brought up that way.  I'm too rusty with OE to
> > > say how we do it today, but it's not likely that auto is needed.
> >
> > Unfortunately, the busybox ifup applet does not support the
> > allow-hotplug keyword.
> >
> > Based on the feedback, I'll add 'auto eth0'.
>

fwiw with this change my nfsrooted rfs does not boot. I think its a
nice to have nfsroot option for dev work.


