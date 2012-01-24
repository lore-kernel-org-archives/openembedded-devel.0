Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RpefR-0007N6-BW for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jan 2012 12:36:01 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RpeXt-0008Il-GT for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jan 2012 12:28:13 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2012 12:28:13 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2012 12:28:13 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 24 Jan 2012 12:27:55 +0100
Message-ID: <jfm4js$jg7$1@dough.gmane.org>
References: <CALbNGRQoDcEN3MfyDYCKe94=AgU6vK5rQcE7sWnaHnGyy6C51w@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <CALbNGRQoDcEN3MfyDYCKe94=AgU6vK5rQcE7sWnaHnGyy6C51w@mail.gmail.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-oe 1/3] babl: initial add 0.1.6
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
X-List-Received-Date: Tue, 24 Jan 2012 11:36:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 24-01-12 10:33, Andreas Müller schreef:
> On Tuesday, January 24, 2012 01:41:51 AM Khem Raj wrote:
> 
>> On (23/01/12 08:24), Andreas Müller wrote:
>>> +FILES_${PN} += "${libdir}/babl-*/*.so"
> 
>> 
> 
>> sometimes .so are symlinks and should really go into -dev packages
> 
>> can you double check if thats not the case here ?
> I checked for babl/gegl/gimp: All these are files. Anyway: AFAIK there 
> would be a QA message for *.so symlinks - there are none.

They are plugins, not shared libraries, so the current recipe is OK.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8elbkACgkQMkyGM64RGpEeiQCgn3vwqcbS7Od5/ZcT4EqJ7MNO
9uMAoLSZziI/12oMpisSLbjWC1Qf7n5o
=vTeq
-----END PGP SIGNATURE-----



