Received: from qw-out-1920.google.com ([74.125.92.148])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1NRf0Q-0007Mh-Hn
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 05:57:29 +0100
Received: by qw-out-1920.google.com with SMTP id 4so2332500qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jan 2010 20:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=zi9r/ZIrGxGjLZNHj8EaZUgiFSF+L39NNhtDy7STzIQ=;
	b=syxIECutSahkB8jilhK3QMFGvzD22LQp+Z7F/OpW93mYzbTNq3pJdj33N6TYBds14R
	qeLr05+GvdJaTaboNgwsRzbAbLVzilEWePZUlctOjlC3dzjhBmbOk4cFVvmKK3u3+7RQ
	dA4uY6sa3O2Ck3AaDIt7ijH9ZyYYODSr/++ng=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Fc6Nwd+/OuS0OMFTStV8N1U46ZHq7X2Uj/97mn9KF/Hu3yVXysMnlnjO9O9wlA9qXr
	sevkX3D50jGzlkPdt1jMUJ0j9fZtrCY+LTZ86TTQVXY1Zn23hxcYfLjqGeqROhIbbXLU
	e6jbOwEwnxyue4WxT1AP/nIQ8TzjknBI2rjLw=
MIME-Version: 1.0
Received: by 10.229.43.9 with SMTP id u9mr2185839qce.44.1262580924840; Sun, 03 
	Jan 2010 20:55:24 -0800 (PST)
Date: Sun, 3 Jan 2010 20:55:24 -0800
Message-ID: <5e088bd91001032055p77f2aef6sc6e0f916d8f2ee2c@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.92.148
X-SA-Exim-Mail-From: sakoman@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: xf86-input-tslib issues after latest version bump to xorg
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
X-List-Received-Date: Mon, 04 Jan 2010 04:57:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

After the recent xorg version bump to 1.7.3 I am seeing functional
issues with xf86-input-tslib.

The ts_calibrate that is run at first boot runs normally, but
touchscreen events are not being passed properly to X.  At first I
suspected bad calibration values, but running ts_test shows quite good
calibration.  Also, the behavior in X doesn't really appear to be
calibration related.  It almost seems that relative rather than
absolute values are being used.

Is anyone else experiencing this?

Steve


