Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (mail.free-electrons.com [62.4.15.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2747E71C90
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2017 02:00:34 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 110)
	id 7C10F21D02; Sun, 29 Jan 2017 03:00:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (unknown [88.191.26.124])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 54E3920E37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2017 03:00:37 +0100 (CET)
Date: Sun, 29 Jan 2017 03:00:32 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170129020032.t6pwviyuc5xbfazk@piout.net>
References: <20170127190606.9365-1-alexandre.belloni@free-electrons.com>
	<dde007b9-0769-58ad-86ee-62829b6821c1@gmail.com>
MIME-Version: 1.0
In-Reply-To: <dde007b9-0769-58ad-86ee-62829b6821c1@gmail.com>
User-Agent: NeoMutt/20161126 (1.7.1)
Subject: Re: [PATCH][meta-webserver] nginx: handle systemd service file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Jan 2017 02:00:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 27/01/2017 at 11:14:41 -0800, Khem Raj wrote:
> 
> 
> On 1/27/17 11:06 AM, Alexandre Belloni wrote:
> > Inherit the systemd class so the service file is properly handled.
> > Note that by default, the service file will be installed but not enabled.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > ---
> >  meta-webserver/recipes-httpd/nginx/nginx.inc | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
> > index 36f2ac6d71e8..fe943d7c290c 100644
> > --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> > @@ -20,7 +20,10 @@ SRC_URI = " \
> >      file://nginx.service \
> >  "
> >  
> > -inherit update-rc.d useradd
> > +inherit update-rc.d useradd systemd
> > +
> > +SYSTEMD_SERVICE_${PN} = "nginx.service"
> > +SYSTEMD_AUTO_ENABLE_${PN} = "disable"
> 
> why disabled by default if someone is including nginx he/she might be
> interested in using it.
> 

I mimicked what is done for apache2. I would also prefer that it is
started automatically when selected. I simply didn't know what was the
preference for meta-webserver.

I'll resend without disabling if that is fine for everybody.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

