Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id ADA817665F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 11:28:32 +0000 (UTC)
Received: by wmww144 with SMTP id w144so114513119wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 03:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe_de.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=GBpvebsPclbr4qT+t8qtEcoX1ObkYPjF2zt1H0abgFc=;
	b=FC6FcprWmCA71L3U7bGyT9YnxRIKIPAn0a66boIlqWjAMFAZJZe0/gtDrvsMn8zibA
	wz4USWvFWICVKgJO8w0vFHDVVa7TqZ+ePaTK+9wEIBtjKcw7HkhnWponHkiXISD8IC/n
	4rREOMa/AIw5eAgRjSCSWN9UAf3qy4TBwlRZ9EIR/8sAfFHlULQOeKiIZtMx3IR4qNim
	UxsBpzslJcL8E6g91VxL5x1Xu7yQgeV87YFRj87AhV/Va6CimhyHXcBkDDRDuMzHzsxE
	ERo7KePi9kVwa32ovpv5uef3uLS+tPv+o0T4Juvpz9fnNdYvnBQdfpo9E7+wknWJ29xk
	atgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-type:content-transfer-encoding;
	bh=GBpvebsPclbr4qT+t8qtEcoX1ObkYPjF2zt1H0abgFc=;
	b=d3DFMruJAipYvh0w94ZJoPY/JrrJvg9E6dVFkKP2ee2Bvm/MbU+qXDaBJNMnDuFFof
	icHdY1beQ2TV/u54+N17FXPamo7p50jeNZZG0Ry8mp1Ts3jLfU+0zdarFDlaSzxAci77
	G1tDyhNlG2nsPBjmCjesvTMq22aMbggWvQRIB0oTSJxMjxhasH53LnmWClc2GTeiaYaG
	80U05DuZ19ls+V+oHGGcHiBS4DYRpRLhh1ZUFhE7/1d5e+iUlbbgKtLHuAYYeklSSb8n
	jitwsGwTRnKmuQF+a4152cNsDltlRlrTYfy/hg6eGUZo0GeJTZIOoa8vmBLXpy0Gvr3q
	+YHA==
X-Gm-Message-State: ALoCoQk9PH8GsE2Baf2pOig8XSDZUF0pBOVt/cM1XN1xc4vIbntLisW/zRTOjh4md5GOk0iwn3vi
X-Received: by 10.194.189.228 with SMTP id gl4mr36395492wjc.44.1447673312210; 
	Mon, 16 Nov 2015 03:28:32 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	i18sm18124758wmf.6.2015.11.16.03.28.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 03:28:31 -0800 (PST)
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Kang Kai <kai.kang@windriver.com>, Martin Jansa <Martin.Jansa@gmail.com>,
	Chen Qi <Qi.Chen@windriver.com>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <5649BDDE.6030107@dresearch-fe.de>
Date: Mon, 16 Nov 2015 12:28:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
Subject: rsyslog: buggy systemd/ua handling?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Nov 2015 11:28:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

I'm not sure but i believe there's a bug in the systemd/ua-handling in meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb.

In my opinion this code

    if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
        pn = d.getVar('PN', True)
        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-service')
        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir', True)))
        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/rsyslog.service' % (d.getVar('systemd_unitdir', True)))

registers the systemd service file under the (ua-)name "syslog-service". So it should not be

  SYSTEMD_SERVICE_${PN} = "${BPN}.service"

but

  SYSTEMD_SERVICE_${PN} = "syslog.service"

Right?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

