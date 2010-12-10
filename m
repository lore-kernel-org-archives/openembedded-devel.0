Received: from [213.160.213.92] (helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1PR4If-0008G3-Dz
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Dec 2010 15:50:22 +0100
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Fri, 10 Dec 2010 15:47:53 +0100
X-TM-IMSS-Message-ID: <1bf369f30000bf70@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 1bf369f30000bf70 ;
	Fri, 10 Dec 2010 15:47:55 +0100
Message-ID: <4D023D98.4080606@nedap.com>
Date: Fri, 10 Dec 2010 15:47:52 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 10 Dec 2010 14:47:53.0485 (UTC)
	FILETIME=[3996F3D0:01CB9879]
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: strange usb behavior
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
X-List-Received-Date: Fri, 10 Dec 2010 14:50:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All!

I'm observing some strange usb behavior.
I have a board with an onboard ftdi usb chip acting as 2 rs232 ports.
And I have on the same board an external usb device with again a ftdi 
chip on board, this time acting as a single rs485 port.

    Build Configuration:
    BB_VERSION        = "1.8.18"
    METADATA_BRANCH   = "release-2010.12"
    METADATA_REVISION = "dec3967"
    TARGET_ARCH       = "arm"
    TARGET_OS         = "linux-gnueabi"
    MACHINE           = "at91sam9263ek-special"
    DISTRO            = "angstrom"
    DISTRO_VERSION    = "2010.7-test-20101210"
    TARGET_FPU        = "soft"

So when I boot with the external device in the connector the internal 
and external devices are detected as expected.

     [    1.280000] usb 1-1: new full speed USB device using at91_ohci 
and address 2
     [    1.460000] usb 1-1: configuration #1 chosen from 1 choice
     [    1.470000] ftdi_sio 1-1:1.0: FTDI USB Serial Device converter 
detected
     [    1.470000] usb 1-1: Detected FT2232C
     [    1.480000] usb 1-1: Number of endpoints 2
     [    1.480000] usb 1-1: Endpoint 1 MaxPacketSize 64
     [    1.490000] usb 1-1: Endpoint 2 MaxPacketSize 64
     [    1.490000] usb 1-1: Setting MaxPacketSize 64
     [    1.500000] usb 1-1: FTDI USB Serial Device converter now 
attached to ttyUSB0
     [    1.510000] ftdi_sio 1-1:1.1: FTDI USB Serial Device converter 
detected
     [    1.510000] usb 1-1: Detected FT2232C
     [    1.520000] usb 1-1: Number of endpoints 2
     [    1.520000] usb 1-1: Endpoint 1 MaxPacketSize 64
     [    1.530000] usb 1-1: Endpoint 2 MaxPacketSize 64
     [    1.530000] usb 1-1: Setting MaxPacketSize 64
     [    1.540000] usb 1-1: FTDI USB Serial Device converter now 
attached to ttyUSB1
     [    1.680000] usb 1-2: new full speed USB device using at91_ohci 
and address 3
     [    1.860000] usb 1-2: configuration #1 chosen from 1 choice
     [    1.870000] ftdi_sio 1-2:1.0: FTDI USB Serial Device converter 
detected
     [    1.880000] usb 1-2: Detected FT232RL
     [    1.880000] usb 1-2: Number of endpoints 2
     [    1.890000] usb 1-2: Endpoint 1 MaxPacketSize 64
     [    1.890000] usb 1-2: Endpoint 2 MaxPacketSize 64
     [    1.900000] usb 1-2: Setting MaxPacketSize 64
     [    1.900000] usb 1-2: FTDI USB Serial Device converter now 
attached to ttyUSB2


But if I look at the /dev directory ttyUSB2 is missing!

     # ls -l /dev/ttyU*
         crw-rw----    1 root     dialout  188,   0 Jan  1  1970 
/dev/ttyUSB0
         crw-rw----    1 root     dialout  188,   1 Jan  1  1970 
/dev/ttyUSB1

     # lsusb
         Bus 001 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
         Bus 001 Device 002: ID 0403:6010 Future Technology Devices 
International, Ltd FT2232C Dual USB-UART/FIFO IC
         Bus 001 Device 003: ID 0403:6001 Future Technology Devices 
International, Ltd FT232 USB-Serial (UART) IC

So, why is ttyUSB2 gone and are ttyUSB[01] still available??

If I then remove (mark the second line!)

     [  103.600000] usb 1-2: USB disconnect, address 3
     [  103.610000] ftdi_sio ttyUSB2: FTDI USB Serial Device converter 
now disconnected from ttyUSB2
     [  103.630000] ftdi_sio 1-2:1.0: device disconnected

and re-enter the external device life is OK!

     [  140.020000] usb 1-2: new full speed USB device using at91_ohci 
and address 4
     [  140.200000] usb 1-2: configuration #1 chosen from 1 choice
     [  140.230000] ftdi_sio 1-2:1.0: FTDI USB Serial Device converter 
detected
     [  140.250000] usb 1-2: Detected FT232RL
     [  140.250000] usb 1-2: Number of endpoints 2
     [  140.250000] usb 1-2: Endpoint 1 MaxPacketSize 64
     [  140.260000] usb 1-2: Endpoint 2 MaxPacketSize 64
     [  140.260000] usb 1-2: Setting MaxPacketSize 64
     [  140.270000] usb 1-2: FTDI USB Serial Device converter now 
attached to ttyUSB2

     # ls -l /dev/ttyU*
         crw-rw----    1 root     dialout  188,   0 Jan  1  1970 
/dev/ttyUSB0
         crw-rw----    1 root     dialout  188,   1 Jan  1  1970 
/dev/ttyUSB1
         crw-rw----    1 root     dialout  188,   2 Dec 10 02:18 
/dev/ttyUSB2

     # lsusb
         Bus 001 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
         Bus 001 Device 002: ID 0403:6010 Future Technology Devices 
International, Ltd FT2232C Dual USB-UART/FIFO IC
         Bus 001 Device 004: ID 0403:6001 Future Technology Devices 
International, Ltd FT232 USB-Serial (UART) IC

Any ideas??

Thanks!
Jaap



