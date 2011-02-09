Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PnI0j-0003FM-Cy
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 22:55:41 +0100
Received: by qyk36 with SMTP id 36so515122qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 13:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=u9bZEX6ZpdTPPe/xC9OeScHbdUZh/Wx8DnIk1yYd/fM=;
	b=QzK1KEKljwhMOELZsGt/kss4fk04Ih/IaZJ/jjkwPFGtJEG9nDWjAil+rNg95XOu2b
	ZWjCwhfOqI8uTO/DTXoXEjeaRLbgGJ28eYHkIiTvLjRG4gGR+AasGh1UbYf7KMw6Svrl
	Awm+yz1wKyws0F6w0sDQ5ou4vTGmPKjr9lx2s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=KDRzin92ujWAOxxB7bg82404gDHOWrFv/yXvlbu7lT9sh4GCXkMdpYUZiFom2SmeLh
	NS419P34xtjKI7ytzmmsa1H/MlBmRzF2Gmid8uGSE8gazoZ/O8nNoW9WLNZdCEJUK4r6
	8Q0ierL2OirCVr60QEoOxykrHFBcD+DYPmD7g=
MIME-Version: 1.0
Received: by 10.229.6.207 with SMTP id a15mr15343154qca.298.1297288477107;
	Wed, 09 Feb 2011 13:54:37 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Wed, 9 Feb 2011 13:54:37 -0800 (PST)
Date: Wed, 9 Feb 2011 22:54:37 +0100
Message-ID: <AANLkTik+8d-hWG+ndtvSP7cKbbHhfyXq3tLxw1Fyi-=6@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Problem with makedevs
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
X-List-Received-Date: Wed, 09 Feb 2011 21:55:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I think there is a problem with makedevs scripts. When I build
bootstrap-image for jlime-2010.1.conf, the makedevs binary is a
symlink to busybox.

During bootup it complains about the way it's called from /etc/init.d/devices:

/sbin/makedevs -r / -D /etc/device_table

The proper way for this binary is:

/sbin/makedevs -d /etc/device_table /

It surprises me that nobody has noticed this before - is my
configuration somehow unique? Jlime config file isn't overriding much
here...

What is a proper fix for this?

bye,
Filip Zyzniewski


