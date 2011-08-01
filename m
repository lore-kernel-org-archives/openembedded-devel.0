Received: from mail-ey0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1Qnoik-0001Ds-CX
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 11:23:34 +0200
Received: by eye4 with SMTP id 4so6149768eye.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Aug 2011 02:19:14 -0700 (PDT)
Received: by 10.204.78.7 with SMTP id i7mr1267547bkk.166.1312190354304;
	Mon, 01 Aug 2011 02:19:14 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id a5sm188787bkq.17.2011.08.01.02.19.12
	(version=SSLv3 cipher=OTHER); Mon, 01 Aug 2011 02:19:12 -0700 (PDT)
Message-ID: <4E366F8F.9070005@dresearch-fe.de>
Date: Mon, 01 Aug 2011 11:19:11 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E364EB1.8050800@dresearch-fe.de>
	<CACW_hTaqobWjz4WWneZ1JsfPTeGu8iu=FeinU62sum4-1rkvfw@mail.gmail.com>
In-Reply-To: <CACW_hTaqobWjz4WWneZ1JsfPTeGu8iu=FeinU62sum4-1rkvfw@mail.gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: unnecessary dependencies?
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
X-List-Received-Date: Mon, 01 Aug 2011 09:23:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.08.2011 10:35, Frans Meulenbroeks wrote:
> 2011/8/1 Steffen Sledz <sledz@dresearch-fe.de>
> 
>> We are working on an application which requires libgssdp.
>>
>> libgssdp requires libsoup, libsoup inherits gnome, gnome inherits
>> gtk-icon-cache, gtk-icon-cache rdepends hicolor-icon-theme. So this icon
>> theme (probably a lot more gnome stuff) unnecessarily allocates place in our
>> image (we do not have a GUI). :(
>>
>> Are these deps really necessary?
>>
>>
> I know this does not answer your question, but if you do not have a GUI
> maybe libgssdp is not the best choice for your project.
> You could consider another upnp library (e.g. libupnp).

libupnp supports UPnP 1.0 only and in addition we need SSDP only (not full UPnP).

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


