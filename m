Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OJlzX-0007hM-9q
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 13:20:14 +0200
Received: by fxm9 with SMTP id 9so868796fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 04:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=BmHlJS/iFPIGIToyiAycLdaB3+sa5+pwFuJklUKty7U=;
	b=kWNjM8vryy1IttQePFKgkvWItK3fdaQRn9+Nb0MfY5mY8In+R01xi40p44ECBw7Bxe
	xIYL47cGKqSoi6EHKKVpcbQTIBuxvm3MqiblFcuHZukP1BZJVivUxMLaUnl8HLDVrU5y
	kv84avh13apd/DTlBP4YG50McctHnn3JE7q+g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=I2WemYAasgyDCSP2xrh4aU2kxT2NQcTiKncVsH5eCeQVYztm/XodtDwbRzjVOlt25R
	ra41RDr4ECUycJJGgZ1po7oZuMrOU722JgdXlCMFVRMwJXGBF07ylUYSj0lZam0OCm8t
	EqEGdtQZoJCcBUOA2dFMpl2twTcdhn9OsPNYY=
Received: by 10.223.30.130 with SMTP id u2mr8468442fac.70.1275477356516;
	Wed, 02 Jun 2010 04:15:56 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 7sm51837052far.6.2010.06.02.04.15.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 04:15:55 -0700 (PDT)
Date: Wed, 2 Jun 2010 13:15:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100602111548.GD16035@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Opkg removing not-really-orphaned files during opkg upgrade
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
X-List-Received-Date: Wed, 02 Jun 2010 11:20:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

few times I've run to strange issues with missing files after opkg
upgrade, now I have simple case there I can guess what happened. Please
comment if I'm doing something wrong or if it's known issue (but not
fixed because it's to hard without changing lot of opkg internals?).

/etc/pointercal.xinput is now installed by package pointercal-xinput and
not xinput-calibrator
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=fb641200b65b3d3c465332efb1febab7001eff47

The problem which needs your manual intervention is when you see:
Upgrading xinput-calibrator on root from 0.6.1-r1.4 to 0.6.1-r7.0.4...
Downloading
http://build.shr-project.org/tests/shr-unstable/ipk//armv4t/xinput-calibrator_0.6.1-r7.0.4_armv4t.ipk.
Installing pointercal-xinput (0.0-r0.4) to root...
Downloading
http://build.shr-project.org/tests/shr-unstable/ipk//om-gta02/pointercal-xinput_0.0-r0.4_om-gta02.ipk.
Not deleting modified conffile /etc/pointercal.xinput.
Configuring pointercal-xinput.
Configuring xinput-calibrator.
Collected errors:
 * file_md5sum_alloc: Failed to open file /etc/pointercal.xinput: No such file or directory.

Then opkg upgraded xinput-calibrator to version without
pointercal.xinput and in the same batch installed new pointercal-xinput
package providing the same file. And in the end removed
/etc/pointercal.xinput file because it was "orphaned" from
xinput-calibrator packages :/.

Best way to fix this is to call
opkg install -force-reinstall pointercal-xinput
after opkg upgrade.

opkg remove xinput-calibrator; opkg install xinput-calibrator; should
probably also "upgrade" xinput-calibrator properly.

Reagards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


