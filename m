Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RZ0iu-0001Rx-M6 for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 14:42:49 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RZ0cI-0005rC-St for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 14:35:58 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 14:35:58 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 14:35:58 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 09 Dec 2011 14:35:40 +0100
Message-ID: <jbt2rc$l31$1@dough.gmane.org>
References: <4EE17931.7000609@googlemail.com>
	<CABcZANn76DwH5QPkZw_zPVBHxS0F3a-7YgKebU3Hd=+CtZd+eQ@mail.gmail.com>
	<4EE20646.2030300@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <4EE20646.2030300@googlemail.com>
X-Enigmail-Version: 1.3.3
Subject: Re: packages versioning
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
X-List-Received-Date: Fri, 09 Dec 2011 13:42:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 09-12-11 13:59, Mr Dash Four schreef:
> 
>>> Is there a way I could force/select a particular version of a
>>> specific package in a given target?
>>> 
>>> I am building my fso-console-image and I would like it to use
>>> udev-165 instead of udev-162, but I can't find a way to alter this. I
>>> could build udev-165 separately - no problem, but don't know how to
>>> integrate this into the main task of building the image itself.
>>> 
>> 
>> PREFERRED_VERSION_udev = "165"
>> 
>> 
>>> Also, is there a way I can include additional packages as part of
>>> that fso-console-image build? I'd like to have openvpn, a different
>>> version of wpa_supplicant, openssl etc.
>>> 
>> 
>> IMAGE_INSTALL_append = " openvpn"
>> 
> Superb, thank you! One more query regarding this - how do I remove
> packages I do not want included in the final image? Is there a way to do
> that (fairly) easily?

Yes, create your own image recipe.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7iDqoACgkQMkyGM64RGpE03wCfcIs3EgRCInV/7UR4HHhslFZN
57kAoKbY+qE+wCxTLMQbEczLYiSr+a+u
=4Wsq
-----END PGP SIGNATURE-----



