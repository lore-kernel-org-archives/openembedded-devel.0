Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SUzmZ-00005w-Qp for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 14:26:15 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SUzcr-00082L-Id for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 14:16:13 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 14:16:13 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 14:16:13 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 17 May 2012 14:16:03 +0200
Message-ID: <jp2q63$khc$1@dough.gmane.org>
References: <1337246639-5192-1-git-send-email-Martin.Jansa@gmail.com>
	<jp2i06$mvm$1@dough.gmane.org>
	<20120517110438.GF3164@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <20120517110438.GF3164@jama.jama.net>
X-Enigmail-Version: 1.4.1
Subject: Re: [meta-oe][PATCH] systemd: create /var/run/utmp
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
X-List-Received-Date: Thu, 17 May 2012 12:26:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 17-05-12 13:04, Martin Jansa schreef:
> On Thu, May 17, 2012 at 11:56:22AM +0200, Koen Kooi wrote: Op 17-05-12
> 11:23, Martin Jansa schreef:
>>>> * it was created by volatiles before,
> 
> If it was done by volatiles before shouldn't it be a tmpfile.d/ snippet 
> instead of do_install_append? /var/run gets clean on boot on a lot of
> systems.
> 
>> Do you have symlink /var/run -> /run?
> 
>> Here /var/run is normal directory (without tmpfs mounted there, not
>> cleaned on boot), so it's enough to create it once

Angstrom uses this:

root@beagleboneA3-0428:~# cat /etc/tmpfiles.d/var-run.conf
# empty /var/run
R	/var/run/*	-	-	-	-	-

Some apps (e.g. avahi-daemon) to clean up their old-style pid files and fail
to start every other boot. Se we let systemd clean it on boot.

Something like:

f    /var/run/utmp   0644 root root - -

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPtOwDAAoJEHZqAkdh1vT6XS8P/i1LUiDy+2F+HiP934wdQgBJ
X15EPI3Dly+P5BwdGAkJRM/zLgMgqkGQ7tKeJoyGjW4GJq9rN/D1iU1+Vj0VyQFN
3ud2eQAUUsb3HP9pOCitL2tzkGLDOpNJIBAYwMTNVnBmway6T5JFsvRaNpGtBLIr
dClrOEmNqN4yZvoHcoMCearVlRuyUqQJo624StktEp4et/h4ekVUvIiOsUqoChgr
X/fQn91oLdvHdVcMdH50ylaVGfchkfvLERvHlwRrUM76l+JyDyqmnjjEcLv4b4J7
4NkzVaoCEoe9xQs6Tuo9PLBoksBx7Wp7N0p9MlWoLATvgISk3OoLnv22KMcjN/Vl
V11Eti73PyFPoQiC2n9iqKQ91HgwWtjQelQIlbzW7GzyEBvHCHBrfVrNi10CPr6U
vC9pJpSLMzvZ2bgOC9jfAFI0INq2Pcdx/pxIOXyEEsBDuESzBxbaqvImPsDpoAob
UcNrzLvRF6CvtiWH8ivygpr03htICIK1636K4xRPMkdLzJXzwIjank23to7YJyyK
7IEokBFLJTBTxDY+EY3HBw840VnwhV+veHfPgZsC+orheXBxVeWzGVvKlSNTqYd0
clQe8OAlXXszPyxWaT83QyJAMP76ZCCqpDVad/q7kQO1gApQpAa5uGXsGz54pSe4
jw5N4Hw0T+as1pgWC63+
=WFtW
-----END PGP SIGNATURE-----



