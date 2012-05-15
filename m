Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jtobias@viaas.com>) id 1SUQUD-0007to-BW
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 00:44:57 +0200
Received: by qcso7 with SMTP id o7so75366qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 15:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=+SQx8xFgahJvHngT3V3LbXrO6O60OI1JtqiG5AAw5MQ=;
	b=bEVOJy+jjaekBDsnB/H9NPeTRp1D/LVBYpaxsnkGak8ysTDlI4gjv2kTuakHpw8spu
	b3oVMxrQpiMU0QQflKQg1IhmWhWKZDGY1/kVGtt9z9UrMknFuMs3J85ASKa6tSOBzZtB
	L7ewCwXYcbF0xykHprEvLMFKenNSokJp2kd+IgCKRpcoCi2rw5I6mhgKI5cv/ra6Ae8t
	cY4oFC1t+y+Nqwo01hQToerddCiEQKv89Dk6cBSmMzMSpDlxfQLNGX0SNc0/NyEC5L4H
	Y+nVGwVKJtYt+6xhcmmREJrPnj6SX5xBOzifwBVUW/buDJKl0H7VBVHsXU7SN2moaGmO
	rSjA==
MIME-Version: 1.0
Received: by 10.224.105.202 with SMTP id u10mr6453317qao.54.1337121296476;
	Tue, 15 May 2012 15:34:56 -0700 (PDT)
Received: by 10.229.81.195 with HTTP; Tue, 15 May 2012 15:34:56 -0700 (PDT)
Date: Tue, 15 May 2012 15:34:56 -0700
Message-ID: <CAJfOToUiw6yqaY8ski5XHXja1c_PNeNTO-MDJjVZhZb308WahA@mail.gmail.com>
From: John Tobias <jtobias@viaas.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQllu5Mb/VQq2HYI2l+Fz8c6hhe27ej3CbI0dZf24VpTcVsf8Gk2MQsy7PyXj03VLzKokOUj
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: 169.254 subnet
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
X-List-Received-Date: Tue, 15 May 2012 22:44:57 -0000
Content-Type: text/plain; charset=UTF-8

Hello All,

My board has a eth0 and wireless interfaces. I manually executed the
following commands to configured my network interfaces:

1. ifconfig eth0 192.168.3.139 netmask 255.255.255.0 up
2. ifconfig wlan0:1 inet 169.254.6.199 netmask 255.255.0.0 broadcast
169.254.255.255 up


My Routing table:
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
192.168.3.0     *               255.255.255.0   U     0      0        0 eth0
169.254.0.0     *               255.255.0.0     U     0      0        0 ra0


My other machine is in 192.168.3.x subnet and I am able to ping the
192.168.3.139. But, the problem is I can ping the 169.254.6.199 too.

Is there any special on 169.254 because by using the said subnet it seems
the two interfaces has a cross over routing?.
Any idea how to resolve the issue?.

Thanks,

john

