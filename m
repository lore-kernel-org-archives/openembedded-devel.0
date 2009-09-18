Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Mocr4-00051b-HC for openembedded-devel@lists.openembedded.org;
	Fri, 18 Sep 2009 14:46:29 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MocqY-0006PC-Ch
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Sep 2009 14:45:54 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2009 14:45:54 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2009 14:45:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 18 Sep 2009 14:45:27 +0200
Message-ID: <h8vvd7$imo$1@ger.gmane.org>
References: <91283b620909180239h5ccfd8c1p576370802938c5be@mail.gmail.com>
	<91283b620909180245r2e6a1d4u5f4b5a57468ae7d8@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <91283b620909180245r2e6a1d4u5f4b5a57468ae7d8@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: "Warning: You do not seem to have the base GStreamer plugins installed. All audio and video support has been disabled"
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
X-List-Received-Date: Fri, 18 Sep 2009 12:46:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

You probably want 
http://www.angstrom-distribution.org/repo/?pkgname=gst-plugins-base-meta

regards,

Koen

top-posting is bad, I know

On 18-09-09 11:45, Stuart Gray wrote:
> Hi
>
> I have been working on integrating Qt4-embedded, phonon and gstreamer into
> my image. This has taken some time and now that I am in position where I
> believe all of the correct packages are installed I have started to test my
> system.
>
> I have loaded phonon-backend and libqsqlite manually as the Qt integration
> does not seem to pull these into the image.
>
> Sql is working as expected as my database is created. It seems to be the
> gstremer installation that is now problematic.
>
> When I run my application I get the following error:
>
> "Warning: You do not seem to have the base GStreamer plugins installed.
>            All audio and video support has been disabled"
> Phonon::GStreamer::Backend: Failed to initialize GStreamer
>
> (<unknown>:1640): GStreamer-CRITICAL **: gst_element_set_state: assertion
> `GST_IS_ELEMENT (element)' failed
> WARNING: Phonon::createPath: Cannot connect  Phonon::MediaObject ( no
> objectName ) to  Phonon::AudioOutput ( no objectName ).
>
> I have tried to use opkg to understand what libraries are missing.
>
> One library fails to be located libc6. Looking at the web pages
> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/, there is no
> link. I am not sure if this is required, but looking through the Debian
> packages website it suggests that this is a dependency of the
> gstreamer-plugins-base package. This does not mean that the OE solution
> requires it, but I am not sure where else to look for help.
>
> I am at a loss as to how to solve this and need help urgently.
>
> I have attached several of my bb/inc files which should show what I am
> trying to achieve.
>
> Thanks in advance for you help.
> Stuart
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




