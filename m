Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tijyl-00047x-VW
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2012 11:55:58 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 12 Dec 2012 02:41:21 -0800
Received: by mail-ia0-f197.google.com with SMTP id x26so1108170iak.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2012 02:41:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=kn58SDobNWEn0tt2CM7PiwK+GTAZvXZovaaDHjs/vcc=;
	b=hAGLtkCh57TuO7DA2QAK00Sdz0t7pYAaFbTsIdRqNlXKhkuzc7MGnMn0IZctS96C+4
	yeeD/a1T1174+kLZ5HyJn4jOlLDNJynVzsxRoPMiS1lE0+7FxyEW1APZemjexiDLjrCY
	+e4hjurD892lcUfddbPEECCre9N+faeJdnf8IEQODMUlKtVY+Y8rYdYae512x520wYUx
	E0Pzcx9uxmEq5lbgXo40sjEG0zJSZj8GX+yHe11T3U085DwLZMwgWDzx29vB3KMkmY5P
	sTHKJ4siamTKnXoq2wpaadhrEVxQrE8FaF9hp4+0leOdfz+kaCwjUNGbSSp1l+eRn4xM
	qsRw==
Received: by 10.60.4.226 with SMTP id n2mr245927oen.63.1355308880817;
	Wed, 12 Dec 2012 02:41:20 -0800 (PST)
Received: by 10.60.4.226 with SMTP id n2mr245920oen.63.1355308880699; Wed, 12
	Dec 2012 02:41:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Wed, 12 Dec 2012 02:40:59 -0800 (PST)
In-Reply-To: <CA+chaQfLt+ojRLbMswZ6PPoDo74u9ObaNarFxi_Mc7dL+hKvZg@mail.gmail.com>
References: <20121211160121.2346510330@opal>
	<CA+chaQfLt+ojRLbMswZ6PPoDo74u9ObaNarFxi_Mc7dL+hKvZg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Dec 2012 10:40:59 +0000
Message-ID: <CAJTo0LZC+TFnO-_L2djssVFb7xoLXCurDDykErrKN7t_K5NWFg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQnrVLUO5bhs3nyKGoopAU1ZpQuN6s+DSLfKhx3YE7f1AvTuZBkt64QWebDKMQy+J/j0SXhzkxinEaNGk5Fl+BdLpfGy1+xnMIwBLsdAf7TLVLH06oDAXRvCZBpF1qhVW+/f+Q4J0SK8RP8DH6K0qBiO6GrwqyLSOZaWn9EavCYYXgu5IZJ3tp3jrjcmwQRa543NVeIO
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : mesa: upgrade to 8.0.5
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
X-List-Received-Date: Wed, 12 Dec 2012 10:55:58 -0000
Content-Type: text/plain; charset=UTF-8

On 12 December 2012 09:39, Martin Jansa <martin.jansa@gmail.com> wrote:
> One of those patches caused new warning
>
> WARNING: QA Issue: mesa-dri: Files/directories were installed but not shipped
>   /usr/lib/pkgconfig/osmesa.pc

None of my machines actually build that so I didn't notice -
previously it must have fallen into mesa-dri-dev instead of the
correct libosmesa-dev.  Patch sent.

Ross


