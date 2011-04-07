Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1Q7z1L-0002Jt-TQ
	for Openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 01:53:51 +0200
Received: by fxm19 with SMTP id 19so2347273fxm.6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 16:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=iFd3YuBg7MJnPfzvf6YnMDqaCd2y+VlorA2swjuQ61E=;
	b=I+PtHZRpI5MDxgsX9qD9Z/B8Kt32EJQFXd10ZqyrxZ5PR97CWGnoa6AijO4besV+ND
	NOeK1k0Vv11pslNT0qlSCj7LslFrhxPs339JoZLK1L2133vbumB+Qb+IOVeoFxX5XUs4
	DPkv0fphhj0jhP6KdDeERzBdSIe0tjmREmaK4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=EsQk64W3HcU/QceIuFkliijYap0Hz6AqmiWoVd6wEMfh60r05XYiZRFlgqasB/mw8b
	5uMWcuo94jYOumodd0d+CSbKY4NYdkf8+JAowAltkjPHrIGAgW7xYbFHZGrKUwtMLYxy
	QuJFDCC7EPW+nda5KegyGWBCggNskvPR7y2/0=
MIME-Version: 1.0
Received: by 10.223.161.194 with SMTP id s2mr1541500fax.143.1302220303741;
	Thu, 07 Apr 2011 16:51:43 -0700 (PDT)
Received: by 10.223.75.202 with HTTP; Thu, 7 Apr 2011 16:51:43 -0700 (PDT)
Date: Fri, 8 Apr 2011 11:51:43 +1200
Message-ID: <BANLkTimXZfFJORrAqT9JO1hHVGWenjAfAA@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: Openembedded-devel@lists.openembedded.org
Subject: How do I install python modules for use within recipes?
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
X-List-Received-Date: Thu, 07 Apr 2011 23:53:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi

I have a project which uses python as part of the building process to
generate some C code from some XML which is then later compiled.

The python script uses the python lxml module.

My recipe has a do_compile as follows:

do_compile() {
	cd ${S}/
	make -f Gencode.mk
	make
}

During the make -f Gencode.mk, the python script which imports lxml
fails to do so and fails.

Question: How do I instruct OE to set up the lxml module and make it
available here?

Thanks

Charles


