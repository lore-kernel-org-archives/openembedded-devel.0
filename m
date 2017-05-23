Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id EC34F77B6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 01:30:46 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id 7so9606529wmo.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 18:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=n7mjRU/BbjBego+eugZJIQYdbJT3sly8cohPixal0L4=;
	b=sSxQl2AHud/W3ts4F+v02txHHdxTJqQUZaUg6JGRKpMubJNLOY2agoExSWasWOURHI
	wKEWDDyZtJIEqUIqUdL/3ty5jGHV42y9eyvmX5uI6cxXwzxR6bMM+zw7hMNIE0cgMUpR
	eFyYTqyQVH4Q6BiBatKPviVYJrTL0bCkOdAu6WNIUbosPijSJIuPy5wUvS4nPOzLpiLr
	G1tN8G2Gicyee8bWCvBzASWkERWFV7rHtWM/4XtlqLWHddKmxoBCKwdrFkvwGUVvJ/cu
	xnx2OX2rUqUksn+yU/YqVVl+xo+x8LcJNxa099DoRPTP82vTaOOcavmsekCeRP58P4l8
	AN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=n7mjRU/BbjBego+eugZJIQYdbJT3sly8cohPixal0L4=;
	b=UrxmAS0kwgGqY/SD3rAnxZ6pztIHYxreCmbUVf7EM/GDzSbQ9Qy8KqFjNzwofgaGnb
	qzqhDmCz5wgix8CXuJr7m4YgrRcqSrcvmbHtZuQDxULh3nQMZ9IkYGhxC8oAx6AZTU/3
	hOrvVFOLzD8AxK6jIOnQSb20f8zdeI3sXPBH6ol3qA/vqYmvlQ8xr4JdO+XnG7l7yR7x
	zUh1C0tsMah8T1zNQz6cjERonrGbln5rtNvaS9OnWJ6MbQVlSXQqcAEKX8PUCpYMcrXf
	oAIUkyF+iaPAV6JzjHNZK1c4ihZT4KvKibpaCXvo27XykODV6u7boCQlTGgtbu3EpdSV
	cl/A==
X-Gm-Message-State: AODbwcDXJAaSDxB8W8vqsLkP7OdWZcH51PrbzmjnAedLV3Un4j7NA8CX
	gI7lB5p/pM/S7dIyzzE=
X-Received: by 10.28.236.77 with SMTP id k74mr298556wmh.91.1495503047418;
	Mon, 22 May 2017 18:30:47 -0700 (PDT)
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com.
	[74.125.82.54])
	by smtp.gmail.com with ESMTPSA id 30sm10257255wrp.6.2017.05.22.18.30.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 May 2017 18:30:46 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f54.google.com with SMTP id 7so9606324wmo.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 18:30:46 -0700 (PDT)
X-Received: by 10.28.103.214 with SMTP id b205mr332489wmc.122.1495503046426;
	Mon, 22 May 2017 18:30:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.236.75 with HTTP; Mon, 22 May 2017 18:30:45 -0700 (PDT)
In-Reply-To: <a884c6ab-8723-d322-30ec-52a67573ac28@zonque.org>
References: <a884c6ab-8723-d322-30ec-52a67573ac28@zonque.org>
Date: Mon, 22 May 2017 22:30:45 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpZ+45VOfj-OwhHsCxi+ku5ZfQrGJSsAtgMP41UZi_waQ@mail.gmail.com>
Message-ID: <CAP9ODKpZ+45VOfj-OwhHsCxi+ku5ZfQrGJSsAtgMP41UZi_waQ@mail.gmail.com>
To: Daniel Mack <daniel@zonque.org>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] Support for v4l cameras in QtWebEngine
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 May 2017 01:30:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 22, 2017 at 2:00 PM, Daniel Mack <daniel@zonque.org> wrote:
> Is anyone aware of any specific requirements or PACKAGECONFIG settings
> needed to add V4L support to web applications running inside a
> QtWebEngine widget?

The webrtc support is disabled for embedded-linux profile. I did not
look further on it yet.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

