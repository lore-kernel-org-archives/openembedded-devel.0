Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 98698731D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 21:48:20 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id i129so8880826vkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 13:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=jpZI7xM/2VcTKlHo8i2qgBbDkZ/vWOrFpxoDL6g2KpE=;
	b=HSH9U7opppFZYCWHiHNShNMaLR4XEgDDhT/8JnDxTEI5R5ULItRW6JhsHA0v+0arUt
	BZ6PrfcVUFbSc4BWxoe9Nc1sbjYtZklwThntepyou8ZtnDZTTioTwnWKuhvmxg0uetY2
	LsaKfVKHfgK4Rzw7v5bHo6grMZNHz5DQZ7kLXafKQ4bLaUppgZb1mZNhL5nso8P9YVlB
	91ceEMhRy12tRN/827PqQ83eGdfAQAxKKea2R4bf7NxsJB0lbisFrzgpM1UVoHqrKgXl
	d1aKLEUdSri/33hXJ9mqrstSr4fThgVPEo1ij5MMZHaicmPwsMg0zIJ8DFyg5TIuwA8Y
	rNpw==
X-Received: by 10.31.171.83 with SMTP id u80mr64032156vke.104.1452030500579;
	Tue, 05 Jan 2016 13:48:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Tue, 5 Jan 2016 13:48:01 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 6 Jan 2016 10:48:01 +1300
Message-ID: <CADySD0HoGP1DYOAJb0M-tFKVYHx6SP3CFicCBj5vyMbYXzSDAQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: QT5.4.1 Bluetooth issue
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
X-List-Received-Date: Tue, 05 Jan 2016 21:48:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I am using meta-arago daisy branch for TI AM335x-EVM.

When trying to use QT Bluetooth API, it fails to find the device

QBluetoothLocalDevice localDevice;
// Check if Bluetooth is available on this device
if (localDevice.isValid()) {
 qDebug("is Valid");
 QBluetoothAddress myAddress =3D localDevice.address();
 return true;
} else {
 qDebug("Not Valid");
 return false;
}

I am using
=E2=80=8B
QT5.4.1
=E2=80=8B
and BlueZ 4.101

I can use hciconfig , hcitool, rfcomm, sdptool to operate Bluetooth device


root@am335x-evm:~# hciconfig -a
hci0:   Type: BR/EDR  Bus: UART
        BD Address: 34:B1:F7:E1:49:09  ACL MTU: 1021:6  SCO MTU: 180:4
        UP RUNNING PSCAN ISCAN
        RX bytes:948 acl:0 sco:0 events:42 errors:0
        TX bytes:1294 acl:0 sco:0 commands:42 errors:0
        Features: 0xff 0xfe 0x2d 0xfe 0xdb 0xff 0x7b 0x87
        Packet type: DM1 DM3 DM5 DH1 DH3 DH5 HV1 HV2 HV3
        Link policy: RSWITCH HOLD SNIFF
        Link mode: SLAVE ACCEPT
        Name: 'at-bt'
        Class: 0x4c0100
        Service Classes: Rendering, Capturing, Telephony
        Device Class: Computer, Uncategorized
        HCI Version:  (0x7)  Revision: 0x0
        LMP Version:  (0x7)  Subversion: 0xac7c
        Manufacturer: Texas Instruments Inc. (13)


Is there any known limitation or am I missing something here ?

thanks
Ankur

